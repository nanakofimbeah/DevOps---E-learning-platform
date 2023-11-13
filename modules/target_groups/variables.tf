variable "vpc_id" {
  description = "ID of the VPC where the target group is created"
  type        = string
}

variable "target_instances" {
  description = "List of target instance IDs to attach to the target group"
  type        = list(string)
}
