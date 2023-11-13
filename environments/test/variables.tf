# variables.tf (test)

# AWS region for the test environment
variable "aws_region" {
  type        = string
  description = "AWS region for the test environment"
  default     = "eu-west-2"
}

# EC2 instance type for the test environment
variable "instance_type" {
  type        = string
  description = "EC2 instance type for the test environment"
  default     = "t2.micro"
}

# Number of EC2 instances to create in the test environment
variable "instance_count" {
  type        = number
  description = "Number of EC2 instances to create in the test environment"
  default     = 1
}

# RDS database engine for the test environment
variable "db_engine" {
  type        = string
  description = "RDS database engine for the test environment"
  default     = "mysql"
}

# RDS database instance class for the test environment
variable "db_instance_class" {
  type        = string
  description = "RDS database instance class for the test environment"
  default     = "db.t2.micro"
}

# RDS allocated storage (in GB) for the test environment
variable "db_allocated_storage" {
  type        = number
  description = "RDS allocated storage in GB for the test environment"
  default     = 20
}

# S3 bucket name for the test environment
variable "s3_bucket_name" {
  type        = string
  description = "Name of the S3 bucket in the test environment"
  default     = "test-bucket"
}


