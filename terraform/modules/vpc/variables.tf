variable "vpc_name" {
  description = "Name tag for the VPC"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "public_subnets_cidrs" {
  description = "CIDRs for public subnets"
  type        = list(string)
}

variable "private_subnets_cidrs" {
  description = "CIDRs for private subnets"
  type        = list(string)
}

variable "azs" {
  description = "Availability Zones to spread the subnets across"
  type        = list(string)
}
