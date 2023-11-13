resource "aws_lb" "my_unique_load_balancer" {
  name               = "ecs-load-balancer"
  internal           = false
  load_balancer_type = "application"
  subnets            = var.subnet_ids
  enable_deletion_protection = false

  enable_http2       = true
  enable_cross_zone_load_balancing = true
}

resource "aws_lb_listener" "my_unique_listener" {
  load_balancer_arn = aws_lb.my_unique_load_balancer.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "fixed-response"
    fixed_response {
      content_type = "text/plain"
      status_code  = "200"
      content      = "OK"
    }
  }
}
