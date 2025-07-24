terraform {
  required_version = ">= 1.3.0"         # ينصح بإصدار حديث من Terraform
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.93.0, < 6.0"      # يلبّي كل قيود الـ Modules
    }
  }

  backend "local" {}                    # مازلنا على Backend محلي
}

provider "aws" {
  region = var.aws_region
}
