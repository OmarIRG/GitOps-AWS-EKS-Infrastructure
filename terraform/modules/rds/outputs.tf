output "db_endpoint" {
  description = "RDS PostgreSQL endpoint"
  value       = module.this.db_instance_endpoint
}
