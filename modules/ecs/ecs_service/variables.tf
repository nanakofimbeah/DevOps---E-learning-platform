variable "service_name" {
  description = "The name of the ECS service"
  type        = string
}

variable "desired_count" {
  description = "The desired count of tasks to run"
  type        = number
}

variable "subnets" {
  description = "List of subnets to deploy the service to"
  type        = list(string)
}
