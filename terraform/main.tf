# Fetch all availability zones in the chosen region
data "aws_availability_zones" "all" {}

###############################################################################
# Networking layer (VPC + subnets + NAT)
###############################################################################
module "vpc" {
  source               = "./modules/vpc"

  vpc_name             = var.vpc_name
  vpc_cidr             = var.vpc_cidr
  public_subnets_cidrs = var.public_subnets_cidrs
  private_subnets_cidrs= var.private_subnets_cidrs
  azs                  = data.aws_availability_zones.all.names
}

###############################################################################
# Compute layer (EKS cluster)
###############################################################################
module "eks" {
  source           = "./modules/eks"

  cluster_name     = var.cluster_name
  eks_version      = var.eks_version
  vpc_id           = module.vpc.vpc_id
  private_subnets  = module.vpc.private_subnets
  public_subnets   = module.vpc.public_subnets

  desired_capacity = var.desired_capacity
  max_capacity     = var.max_capacity
  min_capacity     = var.min_capacity
}

###############################################################################
# Container registry (ECR)
###############################################################################
module "ecr" {
  source               = "./modules/ecr"
  repository_name      = var.repository_name
  image_tag_mutability = var.image_tag_mutability
}

###############################################################################
# Data layer (RDS PostgreSQL, Multi‑AZ)
###############################################################################
module "rds" {
  source            = "./modules/rds"
  db_name           = var.db_name
  db_username       = var.db_username
  db_password       = var.db_password

  vpc_id            = module.vpc.vpc_id
  private_subnets   = module.vpc.private_subnets
  eks_cluster_sg_id = module.eks.cluster_security_group_id
}
