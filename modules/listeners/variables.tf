variable "load_balancer_arn" {
  description = "ARN of the load balancer to attach the listener to"
  type        = string
}

variable "listener_port" {
  description = "Port for the listener"
  type        = number
}

variable "listener_protocol" {
  description = "Protocol for the listener"
  type        = string
}
