variable "task_family" {
  description = "The family for the ECS task definition"
  type        = string
}

variable "container_image" {
  description = "The Docker container image to run"
  type        = string
}
