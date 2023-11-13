output "s3_vpc_endpoint_id" {
  description = "The ID of the created VPC endpoint for Amazon S3."
  value       = aws_vpc_endpoint.s3_endpoint[0].id
}

output "dynamodb_vpc_endpoint_id" {
  description = "The ID of the created VPC endpoint for Amazon DynamoDB."
  value       = aws_vpc_endpoint.dynamodb_endpoint[0].id
}
