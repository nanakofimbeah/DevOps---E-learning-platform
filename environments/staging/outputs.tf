# outputs.tf (staging)

# Output the ID of the VPC in the staging environment
output "staging_vpc_id" {
  description = "The ID of the staging VPC."
  value       = aws_vpc.staging_vpc.id
}

# Output the ID of the public subnets in the staging environment
output "staging_public_subnet_ids" {
  description = "IDs of the staging public subnets."
  value       = aws_subnet.staging_public_subnets[*].id
}

# Output the ID of the private subnets in the staging environment
output "staging_private_subnet_ids" {
  description = "IDs of the staging private subnets."
  value       = aws_subnet.staging_private_subnets[*].id
}

# Output the security group ID in the staging environment
output "staging_security_group_id" {
  description = "ID of the staging security group."
  value       = aws_security_group.staging_sg.id
}

# Output the public IP address of the EC2 instance in the staging environment
output "staging_ec2_public_ip" {
  description = "Public IP address of the staging EC2 instance."
  value       = aws_instance.staging_instance.public_ip
}

# Output the endpoint of the RDS database in the staging environment
output "staging_db_endpoint" {
  description = "Endpoint of the staging RDS database."
  value       = aws_db_instance.staging_db.endpoint
}

# Output the name of the S3 bucket in the staging environment
output "staging_s3_bucket_name" {
  description = "Name of the staging S3 bucket."
  value       = aws_s3_bucket.staging_bucket.id
}

# Additional output values specific to your staging environment
# Customize this section as needed
