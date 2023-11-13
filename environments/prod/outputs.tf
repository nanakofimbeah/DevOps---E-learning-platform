# outputs.tf

# Output the ID of the VPC
output "vpc_id" {
  description = "The ID of the created VPC."
  value       = aws_vpc.my_vpc.id
}

# Output the ID of the public subnets
output "public_subnet_ids" {
  description = "IDs of the public subnets."
  value       = aws_subnet.public_subnets[*].id
}

# Output the ID of the private subnets
output "private_subnet_ids" {
  description = "IDs of the private subnets."
  value       = aws_subnet.private_subnets[*].id
}

# Output the security group ID
output "security_group_id" {
  description = "ID of the security group."
  value       = aws_security_group.my_sg.id
}

# Output the public IP address of the EC2 instance
output "ec2_public_ip" {
  description = "Public IP address of the EC2 instance."
  value       = aws_instance.my_instance.public_ip
}

# Output the endpoint of the RDS database
output "rds_endpoint" {
  description = "Endpoint of the RDS database."
  value       = aws_db_instance.my_db.endpoint
}

# Output the name of the S3 bucket
output "s3_bucket_name" {
  description = "Name of the S3 bucket."
  value       = aws_s3_bucket.my_bucket.id
}

# Additional output values specific to your production environment
# Customize this section as needed
