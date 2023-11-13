output "repository_url" {
  description = "The URL of the ECR repository."
  value       = aws_ecr_repository.my_app.repository_url
}

output "repository_name" {
  description = "The name of the ECR repository."
  value       = aws_ecr_repository.my_app.name
}
