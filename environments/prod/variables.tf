# variables.tf

# AWS region for the production environment
variable "aws_region" {
  type    = string
  description = "AWS region for the production environment"
  default = "eu-west-2"
}

# EC2 instance type for the EC2 instance in the production environment
variable "instance_type" {
  type    = string
  description = "EC2 instance type for the production environment"
  default = "t2.micro"
}

# Number of EC2 instances to create
variable "instance_count" {
  type    = number
  description = "Number of EC2 instances to create"
  default = 1
}

# RDS database engine for the production environment
variable "db_engine" {
  type    = string
  description = "RDS database engine for the production environment"
  default = "mysql"
}

# RDS database instance class for the production environment
variable "db_instance_class" {
  type    = string
  description = "RDS database instance class for the production environment"
  default = "db.t2.micro"
}

# RDS allocated storage (in GB) for the production environment
variable "db_allocated_storage" {
  type    = number
  description = "RDS allocated storage in GB for the production environment"
  default = 20
}


