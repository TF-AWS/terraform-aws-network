resource "aws_vpc" "network_vpc" {
  cidr_block                           = var.vpc_cidr
  instance_tenancy                     = var.vpc_instance_tenancy
  enable_dns_support                   = var.vpc_enable_dns_support
  enable_network_address_usage_metrics = var.vpc_enable_network_address_usage_metrics
  enable_dns_hostnames                 = var.vpc_enable_dns_hostnames

  tags = {
    Name       = "Network-vpc-${var.tag_project}"
    CreateDate = formatdate("DD MMM YYYY hh:mm ZZZ", timestamp())
    Author     = var.tag_author
    Project    = var.tag_project
  }
}

resource "aws_internet_gateway" "network_igw" {
  vpc_id = aws_vpc.network_vpc.id

  tags = {
    Name       = "Network-igw-${var.tag_project}"
    CreateDate = formatdate("DD MMM YYYY hh:mm ZZZ", timestamp())
    Author     = var.tag_author
    Project    = var.tag_project
  }
}

# combien de subnet public ?
# une table de routage pour toute subnet public
# combien de subnet privé ?
# une table de routage pour un subnet prive
# combien de zone de disponibilité ?