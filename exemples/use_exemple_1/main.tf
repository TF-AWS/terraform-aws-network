module "network" {
  source  = "owner/acme"
  version = "version"

  aws_region = "eu-central-1"
  number_azs = 1
  subnet_az = ["eu-central-1a"]
}
