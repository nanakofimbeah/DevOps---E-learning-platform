resource "aws_service_discovery_private_dns_namespace" "ecs_namespace" {
  name        = "ecs-namespace"
  description = "Service Discovery for ECS"
  vpc         = aws_vpc.example.id
}

resource "aws_service_discovery_service" "ecs_service" {
  name        = "my-ecs-service"
  dns_config {
    namespace_id = aws_service_discovery_private_dns_namespace.ecs_namespace.id
    dns_records {
      ttl = 60
      type = "A"
    }
  }
}

resource "aws_security_group" "ecs_service_sg" {
  name_prefix = "ecs-service-sg-"
  vpc_id      = aws_vpc.example.id
  // Add your security group rules here
}
