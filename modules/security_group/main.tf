resource "aws_security_group" "my_security_group" {
  name_prefix = "ecs-security-group-"
  description = "Security Group for ECS Services"

  // Ingress rules for allowing traffic
  ingress {
    from_port   = var.ingress_from_port
    to_port     = var.ingress_to_port
    protocol    = var.ingress_protocol
    cidr_blocks = [var.allowed_cidr_blocks]
  }

  // Egress rules for allowing outbound traffic
  egress {
    from_port   = var.egress_from_port
    to_port     = var.egress_to_port
    protocol    = var.egress_protocol
    cidr_blocks = [var.allowed_egress_cidr_blocks]
  }
}
