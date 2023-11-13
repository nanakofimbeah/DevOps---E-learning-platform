# variables.tf

# AWS region for the development environment
variable "aws_region" {
  type    = string
  description = "AWS region for the development environment"
  default = "eu-west-2"
}

# EC2 instance type for the EC2 instance in the development environment
variable "instance_type" {
  type    = string
  description = "EC2 instance type for the development environment"
  default = "t2.micro"
}

# Number of EC2 instances to create
variable "instance_count" {
  type    = number
  description = "Number of EC2 instances to create"
  default = 1
}

# RDS database engine
variable "db_engine" {
  type    = string
  description = "RDS database engine for the development environment"
  default = "mysql"
}

# RDS database instance class
variable "db_instance_class" {
  type    = string
  description = "RDS database instance class for the development environment"
  default = "db.t2.micro"
}

# RDS allocated storage (in GB)
variable "db_allocated_storage" {
  type    = number
  description = "RDS allocated storage in GB for the development environment"
  default = 20
}


