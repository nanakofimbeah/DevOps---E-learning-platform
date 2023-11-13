resource "aws_ecs_task_definition" "ecs_td" {
  family                   = var.task_family
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  execution_role_arn       = aws_iam_role.ecs_td.arn

  container_definitions = jsonencode([
    {
      name  = "my-container"
      image = var.container_image
      portMappings = [
        {
          containerPort = 80
          hostPort      = 80
        },
      ]
    },
  ])
}

resource "aws_iam_role" "iamrole" {
  name = "ecsTaskExecutionRole"
}

output "task_definition_arn" {
  description = "The ARN of the ECS task definition"
  value       = aws_ecs_task_definition.ecs_td.arn
}
