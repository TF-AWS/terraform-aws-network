variable "region" {
  description = "The posible value of the AWS region"
  type        = list(string)
  default     = ["eu-west-1", "eu-west-2", "eu-west-3", "eu-central-1", "eu-north-1"]
}

// AWS informations 

variable "aws_region" {
  description = "The AWS region use to deploy all services"
  type        = string
  validation {
    condition     = contains(var.region, var.aws_region)
    error_message = "The region have to one of this list of region! eu-west-1, eu-west-2, eu-west-3, eu-central-1, eu-north-1"
  }
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