variable "min_ecs_instances" {
  description = "Minimum number of ECS instances"
  type        = number
  default     = 1
}

variable "max_ecs_instances" {
  description = "Maximum number of ECS instances"
  type        = number
  default     = 4
}

variable "initial_ecs_instances" {
  description = "Initial number of ECS instances"
  type        = number
  default     = 2
}

variable "ecs_ami_id" {
  description = "AMI ID for ECS instances"
  type        = string
}

variable "ecs_instance_type" {
  description = "Instance type for ECS instances"
  type        = string
}

variable "ecs_user_data" {
  description = "User data for ECS instances"
  type        = string
}

variable "subnet_ids" {
  description = "Subnet IDs for ECS instances"
  type        = list(string)
}

variable "availability_zones" {
  description = "Availability zones for ECS instances"
  type        = list(string)
}
