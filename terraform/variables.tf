# AWS region where the infrastructure should be created
variable "aws_region" {
  description = "The AWS region where the infrastructure should be created."
  type        = string
}

# A list of public subnet CIDR blocks
variable "public_subnets" {
  description = "A list of public subnet CIDR blocks."
  type        = list(string)
}

# A list of private subnet CIDR blocks
variable "private_subnets" {
  description = "A list of private subnet CIDR blocks."
  type        = list(string)
}

# Example variables for customizing resource names, sizes, and configurations
variable "instance_type" {
  description = "The EC2 instance type for your application servers."
  type        = string
  default     = "t2.micro"
}

variable "app_instance_count" {
  description = "The number of EC2 instances for your application servers."
  type        = number
  default     = 2
}

variable "db_instance_class" {
  description = "The RDS DB instance class."
  type        = string
  default     = "db.t2.micro"
}

variable "db_allocated_storage" {
  description = "The allocated storage for the RDS DB instance (in GB)."
  type        = number
  default     = 20
}




