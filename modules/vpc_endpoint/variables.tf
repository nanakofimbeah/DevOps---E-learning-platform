variable "s3_endpoint_enabled" {
  description = "Enable Amazon S3 VPC endpoint"
  type        = bool
  default     = true
}

variable "dynamodb_endpoint_enabled" {
  description = "Enable Amazon DynamoDB VPC endpoint"
  type        = bool
  default     = true
}
