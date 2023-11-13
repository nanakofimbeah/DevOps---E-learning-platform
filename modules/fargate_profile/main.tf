resource "aws_ecs_fargate_profile" "example" {
  name        = var.fargate_profile_name
  cluster     = aws_ecs_cluster.example.id
  task_definition = aws_ecs_task_definition.example.arn
  subnet_ids  = var.subnet_ids
  tags = var.tags
}

output "fargate_profile_arn" {
  description = "The ARN of the Fargate profile"
  value       = aws_ecs_fargate_profile.example.arn
}
