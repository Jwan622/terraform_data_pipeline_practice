output "cluster_id" {
  description = "The Redshift cluster ID"
  value       = aws_redshift_cluster.jwan_cluster.id
}

output "cluster_endpoint" {
  description = "The connection endpoint"
  value       = aws_redshift_cluster.jwan_cluster.endpoint
}
