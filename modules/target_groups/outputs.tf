output "target_group_arn" {
  description = "ARN of the target group"
  value       = aws_lb_target_group.my_unique_target_group.arn
}
