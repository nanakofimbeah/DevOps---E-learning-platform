resource "aws_vpc_endpoint" "s3_endpoint" {
  count = var.s3_endpoint_enabled ? 1 : 0
  vpc_id       = aws_vpc.example.id
  service_name = "com.amazonaws.global.s3"
}

resource "aws_vpc_endpoint" "dynamodb_endpoint" {
  count = var.dynamodb_endpoint_enabled ? 1 : 0
  vpc_id       = aws_vpc.example.id
  service_name = "com.amazonaws.global.dynamodb"
}

