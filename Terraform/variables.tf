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
  description = "The CIDR use to the VPC"
  type        = string
  default     = "10.0.0.0/16"
  validation {
    condition     = can(cidrhost(var.vpc_cidr, 0)) && can(cidrsubnet(var.vpc_cidr, 8, 0))
    error_message = "The CIDR ${var.vpc_cidr} is not a valide CIDR for a VPC. Please enter a valid CIDR block in the format '10.0.0.0/16'."
  }
}

variable "vpc_instance_tenancy" {
  description = "A tenancy option for instances launched into the VPC."
  type        = string
  default     = "default"
  validation {
    condition     = contains(["default", "instance_tenancy"], var.vpc_instance_tenancy)
    error_message = "The value for 'instance_tenancy' must be either 'default' or 'dedicated'."
  }
}

variable "vpc_ipv4_ipam_pool_id" {
  description = "The id of the ipv4 ipam we want use on vpc"
  type = string
}

variable "tag_project" {
  type        = string
  description = "The project name"
  default     = "Network_vpc"
}