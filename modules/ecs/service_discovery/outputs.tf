output "service_discovery_namespace_id" {
  description = "ID of the service discovery namespace"
  value       = aws_service_discovery_private_dns_namespace.ecs_namespace.id
}

output "service_discovery_service_id" {
  description = "ID of the service discovery service"
  value       = aws_service_discovery_service.ecs_service.id
}
