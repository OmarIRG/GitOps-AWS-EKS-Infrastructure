###############################################################################
# Global / Region
###############################################################################
variable "aws_region" {
  description = "AWS region for all resources"
  type        = string
  default     = "us-east-1"
}

###############################################################################
# VPC parameters
###############################################################################
variable "vpc_name" {
  description = "Name tag for the VPC"
  type        = string
  default     = "learn-vpc"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnets_cidrs" {
  description = "CIDR blocks for public subnets"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnets_cidrs" {
  description = "CIDR blocks for private subnets"
  type        = list(string)
  default     = ["10.0.3.0/24", "10.0.4.0/24"]
}

###############################################################################
# EKS parameters
###############################################################################
variable "cluster_name" {
  description = "EKS cluster name"
  type        = string
  default     = "learn-eks"
}

variable "eks_version" {
  description = "Kubernetes version for EKS"
  type        = string
  default     = "1.29"
}

variable "desired_capacity" {
  description = "Desired # of worker nodes"
  type        = number
  default     = 2
}

variable "max_capacity" {
  description = "Maximum # of worker nodes"
  type        = number
  default     = 3
}

variable "min_capacity" {
  description = "Minimum # of worker nodes"
  type        = number
  default     = 1
}

###############################################################################
# ECR parameters
###############################################################################
variable "repository_name" {
  description = "ECR repository name"
  type        = string
  default     = "learn-repo"
}

variable "image_tag_mutability" {
  description = "ECR tag mutability (IMMUTABLE / MUTABLE)"
  type        = string
  default     = "IMMUTABLE"
}

###############################################################################
# RDS parameters
###############################################################################
variable "db_name" {
  description = "Initial database name"
  type        = string
  default     = "appdb"
}

variable "db_username" {
  description = "Master username for RDS"
  type        = string
  sensitive   = true
}

variable "db_password" {
  description = "Master password for RDS"
  type        = string
  sensitive   = true
}
