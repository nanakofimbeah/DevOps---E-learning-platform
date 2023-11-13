variable "vpc_id" {
  description = "ID of the VPC associated with the route tables"
  type        = string
}

variable "subnet_cidr_blocks" {
  description = "List of subnet CIDR blocks"
  type        = list(string)
}
