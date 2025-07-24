module "this" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 3.0"

  name            = var.vpc_name
  cidr            = var.vpc_cidr
  azs             = var.azs
  public_subnets  = var.public_subnets_cidrs
  private_subnets = var.private_subnets_cidrs

  enable_nat_gateway = true   # Single NAT Gateway (cost‑effective)
  single_nat_gateway = true
  enable_dns_hostnames = true
  enable_dns_support   = true
}
