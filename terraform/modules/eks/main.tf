###############################################################################
# modules/vpc/main.tf
###############################################################################

# We will use the official terraform-aws-modules/vpc/aws module
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 3.0"

  name = var.vpc_name
  cidr = var.vpc_cidr

  azs             = var.azs
  public_subnets  = var.public_subnets_cidrs
  private_subnets = var.private_subnets_cidrs

  enable_nat_gateway   = true
  single_nat_gateway   = true
  enable_dns_hostnames = true
  enable_dns_support   = true

  public_subnet_tags = {
    "Name"            = "${var.vpc_name}-public"
    "k8s.io/role/elb" = "1"
  }

  private_subnet_tags = {
    "Name"                  = "${var.vpc_name}-private"
    "k8s.io/role/internal-elb" = "1"
  }
}

