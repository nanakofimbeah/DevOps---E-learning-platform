# Define outputs to capture and display information from your infrastructure

output "vpc_id" {
  description = "The ID of the created VPC."
  value       = aws_vpc.my_vpc.id
}

output "subnet_ids" {
  description = "The IDs of the created subnets."
  value       = aws_subnet.example[*].id
}

output "db_endpoint" {
  description = "The endpoint of the RDS database."
  value       = aws_db_instance.example.endpoint
}

output "load_balancer_dns" {
  description = "The DNS name of the load balancer."
  value       = aws_lb.example_lb.dns_name
}

output "ecs_cluster_name" {
  description = "The name of the ECS cluster."
  value       = aws_ecs_cluster.example.name
}

output "ecr_repository_url" {
  description = "The URL of the ECR repository."
  value       = aws_ecr_repository.example_repo.repository_url
}

output "ecr_repository_name" {
  description = "The name of the ECR repository."
  value       = aws_ecr_repository.example_repo.name
}


