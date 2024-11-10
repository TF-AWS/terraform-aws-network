locals {
  regions = ["us-east-1", "us-east-2", "us-west-1", "us-west-2", "af-south-1", "ap-east-1", "ap-south-1", "ap-south-2", "ap-southeast-1", "ap-southeast-2", "ap-southeast-3", "ap-northeast-1", "ap-northeast-2", "ap-northeast-3", "ca-central-1", "eu-central-1", "eu-central-2", "eu-west-1", "eu-west-2", "eu-west-3", "eu-south-1", "eu-south-2", "eu-north-1", "me-south-1", "me-central-1", "sa-east-1"]
}

// AWS informations 

variable "aws_region" {
  description = "The AWS region use to deploy all services, by default the value is us-east-1"
  type        = string
  validation {
    condition     = contains(local.regions, var.aws_region)
    error_message = "The region is not a valid AWS region"
  }
  default     = "us-east-1"
}

//récupérer le nombre d'availability zones de la region utiliser par l'utilisateur.
data "aws_availability_zones" "available" {
  state = "available"
}

// Avalability zones

variable "az_number" {
  description = "The number of the Availability Zones where we want deploy our subnets"
  type        = number
  default = 1
}

// VPC informations

variable "vpc_cidr" {
  description = "The CIDR IPV4 use to the VPC"
  type        = string
  validation {
    condition     = can(cidrhost(var.vpc_cidr, 0)) && can(cidrsubnet(var.vpc_cidr, 8, 0))
    error_message = "The CIDR ${var.vpc_cidr} is not a valide CIDR for a VPC. Please enter a valid CIDR block in the format '10.0.0.0/16'."
  }
  default = "10.0.0.0/16"
}

variable "vpc_instance_tenancy" {
  description = "A tenancy option for instances launched into the VPC."
  type        = string
  validation {
    condition     = contains(["default", "instance_tenancy"], var.vpc_instance_tenancy)
    error_message = "The value for 'instance_tenancy' must be either 'default' or 'dedicated'."
  }
  default = "default"
}

/*
variable "vpc_ipv4_ipam_pool_id" {
  description = "The id of the ipv4 ipam we want use on vpc"
  type        = string
  default     = ""
}

variable "vpc_ipv4_netmask_length" {
  description = "The netmask length we want use on vpc. This require ipv4_ipam_pool_id"
  type        = number
  validation {
    condition     = var.vpc_ipv4_ipam_pool_id != "" || var.vpc_ipv4_netmask_length == ""
    error_message = "You have to define vpc_ipv4_ipam_pool_id before use this variable"
  }
  default = 8
} */

variable "vpc_ipv6_cidr_block" {
  description = "The CIDR IPV6 use to the VPC from IPAM Pool"
  type        = string
  default     = ""
}

variable "vpc_enable_dns_support" {
  description = "A boolean flag to enable/disable DNS support in the VPC."
  type        = bool
  default     = true
}

variable "vpc_enable_network_address_usage_metrics" {
  description = "Indicates whether Network Address Usage metrics are enabled for your VPC."
  type        = bool
  default     = false
}

variable "vpc_enable_dns_hostnames" {
  description = "A boolean flag to enable/disable DNS hostnames in the VPC."
  type        = bool
  default     = false
}


variable "tag_project" {
  description = "The project name"
  type        = string
  default     = "Network_vpc"
}

variable "tag_author" {
  description = "The author of the project"
  type        = string
  default     = "Network Module"
}