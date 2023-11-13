# variables.tf (staging)

# AWS region for the staging environment
variable "aws_region" {
  type        = string
  description = "AWS region for the staging environment"
  default     = "eu-west-2"
}

# EC2 instance type for the staging environment
variable "instance_type" {
  type        = string
  description = "EC2 instance type for the staging environment"
  default     = "t2.micro"
}

# Number of EC2 instances to create in staging
variable "instance_count" {
  type        = number
  description = "Number of EC2 instances to create in staging"
  default     = 1
}

# RDS database engine for the staging environment
variable "db_engine" {
  type        = string
  description = "RDS database engine for the staging environment"
  default     = "mysql"
}

# RDS database instance class for the staging environment
variable "db_instance_class" {
  type        = string
  description = "RDS database instance class for the staging environment"
  default     = "db.t2.micro"
}

# RDS allocated storage (in GB) for the staging environment
variable "db_allocated_storage" {
  type        = number
  description = "RDS allocated storage in GB for the staging environment"
  default     = 20
}


