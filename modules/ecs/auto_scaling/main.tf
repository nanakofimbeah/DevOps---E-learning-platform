resource "aws_autoscaling_group" "ecs_auto_scaling" {
  name                 = "ecs-auto-scaling-group"
  launch_configuration = aws_launch_configuration.ecs_launch_config.name
  vpc_zone_identifier  = var.subnet_ids
  min_size             = var.min_ecs_instances
  max_size             = var.max_ecs_instances
  desired_capacity     = var.initial_ecs_instances
  health_check_type    = "ELB"
  load_balancers       = [aws_lb.example.name]
  availability_zones   = var.availability_zones

  tag {
    key                 = "Name"
    value               = "ECS Instance"
    propagate_at_launch = true
  }
}

resource "aws_launch_configuration" "ecs_launch_config" {
  name_prefix             = "ecs-launch-config"
  image_id                = var.ecs_ami_id
  instance_type           = var.ecs_instance_type
  security_groups         = [aws_security_group.ecs_security_group.name]
  key_name                = aws_key_pair.example.key_name
  user_data               = var.ecs_user_data
  iam_instance_profile    = aws_iam_instance_profile.ecs_instance_profile.name
  associate_public_ip_address = true
  lifecycle {
    create_before_destroy = true
  }
}
