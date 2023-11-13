output "fargate_profile_arn" {
  description = "The ARN of the Fargate profile"
  value       = aws_ecs_fargate_profile.example.arn
}
