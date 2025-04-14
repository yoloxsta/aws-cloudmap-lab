output "sta_dns_discovery_id" {
  description = "sta service discovery id"
  value       = aws_service_discovery_private_dns_namespace.sta_dns_discovery.id
}

output "sta_private_dns_namespace" {
  description = "sta service discovery id"
  value       = var.sta_private_dns_namespace
}
