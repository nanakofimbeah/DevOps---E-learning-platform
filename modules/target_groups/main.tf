resource "aws_lb_target_group" "my_target_group" {
  name        = "MyUniqueTargetGroup"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = var.vpc_id
  target_type = "ip"
}

resource "aws_lb_target_group_attachment" "my_unique_attachment" {
  count             = length(var.target_instances)
  target_group_arn  = aws_lb_target_group.my_target_group.arn
  target_id         = var.target_instances[count.index]
}
