output "cluster_id" {
  description = "EKS cluster name"
  value       = module.this.cluster_id
}

output "cluster_endpoint" {
  description = "EKS API server endpoint"
  value       = module.this.cluster_endpoint
}

output "cluster_security_group_id" {
  description = "Security Group ID for the cluster"
  value       = module.this.cluster_security_group_id
}
