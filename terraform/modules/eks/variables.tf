variable "cluster_name"       { description = "EKS cluster name" }
variable "eks_version"        { description = "Kubernetes version" }
variable "vpc_id"             { description = "VPC ID" }
variable "private_subnets"    { description = "Private subnet IDs"  type = list(string) }
variable "public_subnets"     { description = "Public subnet IDs"   type = list(string) }
variable "desired_capacity"   { description = "Desired node count" }
variable "max_capacity"       { description = "Max node count" }
variable "min_capacity"       { description = "Min node count" }
