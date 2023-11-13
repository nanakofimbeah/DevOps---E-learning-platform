provider "aws" {
  region = var.aws_region
}

resource "aws_ecr_repository" "my_app" {
  name = var.repository_name
}

resource "aws_ecr_lifecycle_policy" "my_app_lifecycle_policy" {
  repository = aws_ecr_repository.my_app.name
  policy     = data.template_file.lifecycle_policy.rendered
}

resource "aws_ecr_repository_policy" "my_app_policy" {
  repository = aws_ecr_repository.my_app.name
  policy     = data.template_file.ecr_policy.rendered
}
