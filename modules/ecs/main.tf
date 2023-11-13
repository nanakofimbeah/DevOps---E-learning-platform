resource "aws_ecs_task_definition" "example" {
  family                   = var.task_family
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  execution_role_arn       = aws_iam_role.ecs_execution_role.arn

  // Define container definitions here
  container_definitions = jsonencode([
    {
      name  = "example-container"
      image = var.container_image
      // Other container settings
    }
  ])
}

resource "aws_ecs_service" "example" {
  name            = "example-service"
  cluster         = aws_ecs_cluster.example.id
  task_definition = aws_ecs_task_definition.example.arn
  launch_type     = "FARGATE"

  network_configuration {
    subnets = var.subnet_ids
    security_groups = [aws_security_group.ecs_security_group.id]
  }
}
