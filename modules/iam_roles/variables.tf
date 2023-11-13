variable "role_name" {
  description = "Name of the IAM role"
  type        = string
}

variable "assume_role_policy" {
  description = "IAM assume role policy in JSON format"
  type        = string
}
