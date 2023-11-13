variable "subnet_ids" {
  type    = list(string)
  description = "List of subnet IDs where the ALB will be deployed."
}

variable "vpc_id" {
  type    = string
  description = "VPC ID where the ALB will be deployed."
}

variable "load_balancer_name" {
  type    = string
  description = "Name of the Application Load Balancer."
}
