variable "aws_region" {
  description = "The AWS region where the ECR repository should be created."
  type        = string
}

variable "repository_name" {
  description = "The name of the ECR repository."
  type        = string
}

variable "lifecycle_policy" {
  description = "ECR repository lifecycle policy as a JSON string."
  type        = string
}

variable "access_policy" {
  description = "ECR repository access policy as a JSON string."
  type        = string
}
