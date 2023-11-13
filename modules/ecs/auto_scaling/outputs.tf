output "ecs_auto_scaling_group_name" {
  description = "Name of the ECS Auto Scaling Group"
  value       = aws_autoscaling_group.ecs_auto_scaling.name
}
