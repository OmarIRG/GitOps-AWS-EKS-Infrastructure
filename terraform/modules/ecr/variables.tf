###############################################################################
# modules/vpc/variables.tf
###############################################################################

variable "vpc_name" {
  type        = string
  description = "Name of the VPC"
}

variable "vpc_cidr" {
  type        = string
  description = "CIDR block for the VPC"
}

variable "public_subnets_cidrs" {
  type        = list(string)
  description = "List of CIDRs for public subnets"
}

variable "private_subnets_cidrs" {
  type        = list(string)
  description = "List of CIDRs for private subnets"
}

variable "azs" {
  type        = list(string)
  description = "List of availability zones to use"
}

