# outputs.tf (test)

# Output the ID of the VPC in the test environment
output "test_vpc_id" {
  description = "The ID of the test VPC."
  value       = aws_vpc.test_vpc.id
}

# Output the ID of the public subnets in the test environment
output "test_public_subnet_ids" {
  description = "IDs of the test public subnets."
  value       = aws_subnet.test_public_subnets[*].id
}

# Output the ID of the private subnets in the test environment
output "test_private_subnet_ids" {
  description = "IDs of the test private subnets."
  value       = aws_subnet.test_private_subnets[*].id
}

# Output the security group ID in the test environment
output "test_security_group_id" {
  description = "ID of the test security group."
  value       = aws_security_group.test_sg.id
}

# Output the public IP address of the EC2 instance in the test environment
output "test_ec2_public_ip" {
  description = "Public IP address of the test EC2 instance."
  value       = aws_instance.test_instance.public_ip
}

# Output the endpoint of the RDS database in the test environment
output "test_db_endpoint" {
  description = "Endpoint of the test RDS database."
  value       = aws_db_instance.test_db.endpoint
}

# Output the name of the S3 bucket in the test environment
output "test_s3_bucket_name" {
  description = "Name of the test S3 bucket."
  value       = aws_s3_bucket.test_bucket.id
}


