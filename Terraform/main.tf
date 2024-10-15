resource "aws_vpc" "network_vpc" {
  cidr_block = var.vpc_cidr

  tags = {
    Name       = "network_vpc"
    CreateDate = formatdate("DD MMM YYYY hh:mm ZZZ", timestamp())
  }
}