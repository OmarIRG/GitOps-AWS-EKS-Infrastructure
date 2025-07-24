variable "db_name"           { description = "Initial DB name" }
variable "db_username"       { description = "Master username" sensitive = true }
variable "db_password"       { description = "Master password" sensitive = true }
variable "vpc_id"            { description = "VPC ID" }
variable "private_subnets"   { description = "Private subnet IDs"  type = list(string) }
variable "eks_cluster_sg_id" { description = "EKS cluster SG (for ingress)" }
