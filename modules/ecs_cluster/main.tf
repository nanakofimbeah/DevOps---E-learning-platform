resource "aws_ecs_cluster" "my_cluster" {
  name = var.cluster_name
}

output "cluster_arn" {
  description = "The ARN of the ECS cluster"
  value       = aws_ecs_cluster.my_cluster.arn
}
