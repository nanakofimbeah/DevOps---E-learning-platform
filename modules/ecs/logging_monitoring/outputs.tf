output "cloudwatch_log_group_name" {
  description = "Name of the CloudWatch Logs group"
  value       = aws_cloudwatch_log_group.ecs_log_group.name
}
