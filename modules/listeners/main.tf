resource "aws_lb_listener" "my_listener" {
  load_balancer_arn = aws_lb.my_security_group.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "fixed-response"
    fixed_response {
      content_type = "text/plain"
      status_code  = "200"
      content      = "Hello, World!"
    }
  }
}
