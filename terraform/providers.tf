terraform {
  required_version = ">= 1.1.0"
  backend "local" {}     
}

provider "aws" {
  region = "us-east-1"  
}

