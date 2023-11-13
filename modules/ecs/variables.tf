variable "task_family" {
  description = "ECS task family name"
  type        = string
}

variable "container_image" {
  description = "Docker container image for the ECS task"
  type        = string
}

variable "subnet_ids" {
  description = "List of subnet IDs for the ECS service"
  type        = list(string)
}
