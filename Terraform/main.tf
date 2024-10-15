resource "aws_vpc" "network_vpc" {
  cidr_block                           = var.vpc_cidr
  instance_tenancy                     = var.vpc_instance_tenancy
  ipv4_ipam_pool_id                    = var.vpc_ipv4_ipam_pool_id
  ipv4_netmask_length                  = ""
  ipv6_cidr_block                      = ""
  ipv6_ipam_pool_id                    = ""
  ipv6_netmask_length                  = ""
  ipv6_cidr_block_network_border_group = ""
  enable_dns_support                   = ""
  enable_network_address_usage_metrics = ""
  enable_dns_hostnames                 = ""
  assign_generated_ipv6_cidr_block     = ""

  tags = {
    Name       = "${var.tag_project}-vpc"
    CreateDate = formatdate("DD MMM YYYY hh:mm ZZZ", timestamp())
  }
} 