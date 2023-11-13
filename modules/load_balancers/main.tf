resource "aws_lb" "my_lb" {
  name               = "MyLoadBalancer"
  load_balancer_type = "application"
  subnets            = var.subnet_ids
  enable_deletion_protection = false
  enable_http2 = true
  enable_cross_zone_load_balancing = true
  internal = false
  security_groups = [aws_security_group.my_lb.id]
  vpc_id = aws_vpc.my_vpc.id
  tags = {
    Name = "MyLoadBalancer"
  }
}

resource "aws_security_group" "lb" {
  name_prefix = "lb-"
  vpc_id      = aws_vpc.my_vpc.id

  // Define security group rules here
}
