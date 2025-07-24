module "this" {
  source  = "terraform-aws-modules/ecr/aws"
  version = "~> 2.0"

  repository_name      = var.repository_name
  image_tag_mutability = var.image_tag_mutability
  image_scanning_configuration = {
    scan_on_push = true       # Enable vulnerability scans
  }
}
