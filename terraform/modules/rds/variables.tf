variable "db_name" {
  description = "Initial database name"
  type        = string
}

variable "db_username" {
  description = "Master username"
  type        = string
  sensitive   = true
}

variable "db_password" {
  description = "Master password"
  type        = string
  sensitive   = true
}

variable "vpc_id" {
  description = "VPC ID where RDS will live"
  type        = string
}

variable "private_subnets" {
  description = "Private subnet IDs for RDS subnets"
  type        = list(string)
}

variable "eks_cluster_sg_id" {
  description = "Security-group ID of the EKS cluster (for DB ingress)"
  type        = string
}
