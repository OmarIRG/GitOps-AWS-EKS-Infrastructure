module "this" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 19.0"

  cluster_name    = var.cluster_name
  cluster_version = var.eks_version
  vpc_id          = var.vpc_id
  subnets         = var.private_subnets           # Workers in private subnets

  node_groups = {
    default = {
      desired_capacity = var.desired_capacity
      max_capacity     = var.max_capacity
      min_capacity     = var.min_capacity
      instance_types   = ["t3.medium"]            # Burst‑capable, cost‑effective
    }
  }

  manage_aws_auth = true                          # Maps IAM roles to RBAC
}
