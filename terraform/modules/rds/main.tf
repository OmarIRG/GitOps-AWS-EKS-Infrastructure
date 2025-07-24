# SG allowing Postgres traffic only from EKS worker nodes
resource "aws_security_group" "rds" {
  name   = "${var.db_name}-sg"
  vpc_id = var.vpc_id

  ingress {
    from_port       = 5432
    to_port         = 5432
    protocol        = "tcp"
    security_groups = [var.eks_cluster_sg_id]
    description     = "Allow Postgres from EKS nodes"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

module "this" {
  source  = "terraform-aws-modules/rds/aws"
  version = "~> 6.0"

  identifier              = var.db_name
  engine                  = "postgres"
  engine_version          = "15.4"
  instance_class          = "db.t4g.micro"
  allocated_storage       = 20
  db_name                 = var.db_name
  username                = var.db_username
  password                = var.db_password

  multi_az                = true                    # High availability
  backup_retention_period = 7                       # 7‑day automated backups
  deletion_protection     = true                    # Safety in prod

  subnet_ids              = var.private_subnets
  vpc_security_group_ids  = [aws_security_group.rds.id]
}
