resource "aws_ecs_service" "example" {
  name            = var.service_name
  cluster         = aws_ecs_cluster.example.id
  task_definition = aws_ecs_task_definition.example.arn
  launch_type     = "EC2"
  desired_count   = var.desired_count
  network_configuration {
    subnets         = var.subnets
    security_groups = [aws_security_group.example.id]
  }
  load_balancer {
    target_group_arn = aws_lb_target_group.example.arn
    container_name   = "my-container"
    container_port   = 80
  }
  depends_on = [aws_lb_target_group.example]
}

resource "aws_lb_target_group_attachment" "example" {
  target_group_arn = aws_lb_target_group.example.arn
  target_id        = aws_ecs_service.example.id
}

output "service_arn" {
  description = "The ARN of the ECS service"
  value       = aws_ecs_service.example.arn
}
