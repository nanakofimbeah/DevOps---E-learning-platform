provider "aws" {
  region = var.aws_region
}

# VPC
resource "aws_vpc" "my_vpc" {
  cidr_block = "10.0.0.0/16"
}

# Subnets (Create both public and private subnets with count)
variable "subnet_count" {
  type    = number
  default = 2
}

variable "subnet_types" {
  type    = list(string)
  default = ["private", "public"]
}

resource "aws_subnet" "example" {
  count = var.subnet_count * length(var.subnet_types)

  vpc_id                  = aws_vpc.my_vpc.id
  availability_zone       = element(["eu-west-2a", "eu-west-2a", "eu-west-2b", "eu-west-2b"], count.index)
  cidr_block              = "10.0.${count.index / length(var.subnet_types)}.0/24"
  map_public_ip_on_launch = element(var.subnet_types, count.index % length(var.subnet_types)) == "public"
}

# Security Group
resource "aws_security_group" "my_security_group" {
  vpc_id = aws_vpc.my_vpc.id

  # Define inbound and outbound rules here
}

# Key Pair
resource "aws_key_pair" "example_keypair" {
  key_name   = "example-keypair"
  public_key = file("~/.ssh/id_rsa.pub")
}

# Internet Gateway
resource "aws_internet_gateway" "my_igw" {
  vpc_id = aws_vpc.my_vpc.id
}

# Routing Table
resource "aws_route_table" "my_rt" {
  count = 2
  vpc_id = aws_vpc.my_vpc.id
}

# Route Table Association
resource "aws_route_table_association" "my_rta" {
  count          = 2
  subnet_id      = aws_subnet.my_subnet[count.index].id
  route_table_id = aws_route_table.my_rt.id
}

# Load Balancer
resource "aws_lb" "my_lb" {
  security_groups = ["${aws_security_group.my_lb.id}"]
  subnets         = ["${aws_subnet.my_vpc.*.id}"]
}

# Listener
resource "aws_lb_listener" "my_listener" {
    load_balancer_arn = "${aws_alb.my_security_group.arn}"
  port              = "80"
  protocol          = "HTTP"
  
  default_action {
    target_group_arn = "${aws_alb_target_group.my_target_group.arn}"
    type             = "forward"
  }
}

# Target Group
resource "aws_lb_target_group" "my_target_group" {
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.my_vpc.id
}

# IAM Role and Policy
resource "aws_iam_role" "iamrole" {
}

resource "aws_iam_policy" "my_iam_policy" {
  name        = "my-iam-policy"
  description = "My IAM policy"
  policy      = data.template_file.iam_policy.rendered
}

# RDS
resource "aws_db_instance" "my_db" {
}

# ECR Repository
module "my_ecr" {
  source         = "./modules/ecr"
  repository_name = "my-app"
}

# ECS Cluster
resource "aws_ecs_cluster" "my_cluster" {
}

# ECS Service
resource "aws_ecs_service" "my_service" {
}

# Task Definition
resource "aws_ecs_task_definition" "ecs_td" {
}

# ECS Autoscaling
resource "aws_appautoscaling_policy" "my_scaling_policy" {
}

# ECR Image Data Source
data "aws_ecr_image" "my_image" {
  repository_name = module.my_ecr.repository_name
}

# Health Check
resource "aws_appautoscaling_target" "my_target" {
}
