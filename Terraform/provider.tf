terraform {
  required_version = "~>1.9.0"

  required_providers {
    aws = {
      version = "~>5.54.0"
      source  = "hashicorp/aws"
    }
  }
}

provider "aws" {
  region = var.aws_region
  # chose the right authent methode
}