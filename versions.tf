terraform {
  required_version = "1.9.7"

  required_providers {
    aws = {
      version = "5.70.0"
      source  = "hashicorp/aws"
    }
  }
}