###############################################################################
# Database Output
###############################################################################
output "rds_cluster_id" {
  description = "The RDS Cluster Identifier."
  value       = aws_rds_cluster.aurora.id
}
