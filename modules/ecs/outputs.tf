output "ecs_cluster_id" {
  description = "ID of the ECS cluster"
  value       = aws_ecs_cluster.example.id
}

output "ecs_service_id" {
  description = "ID of the ECS service"
  value       = aws_ecs_service.example.id
}
