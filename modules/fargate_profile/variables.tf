variable "fargate_profile_name" {
  description = "The name of the Fargate profile"
  type        = string
}

variable "subnet_ids" {
  description = "List of subnet IDs for the Fargate profile"
  type        = list(string)
}

variable "tags" {
  description = "Tags for the Fargate profile"
  type        = map(string)
}
