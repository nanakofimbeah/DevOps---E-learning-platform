variable "log_retention_days" {
  description = "Number of days to retain logs in CloudWatch Logs"
  type        = number
  default     = 7
}

variable "cpu_threshold" {
  description = "CPU utilization threshold for the CloudWatch alarm"
  type        = number
  default     = 80
}
