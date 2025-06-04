###############################################################################
# Root-level main.tf
###############################################################################

# This block ensures Terraform versions and sets required providers
terraform {
  required_version = ">= 1.1.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

# Data source to fetch available AZs
data "aws_availability_zones" "available" {}

# VPC Module
module "vpc" {
  source               = "./modules/vpc"
  vpc_name             = var.vpc_name
  vpc_cidr             = var.vpc_cidr
  public_subnets_cidrs = var.public_subnets_cidrs
  private_subnets_cidrs= var.private_subnets_cidrs
  azs                  = data.aws_availability_zones.available.names
}
