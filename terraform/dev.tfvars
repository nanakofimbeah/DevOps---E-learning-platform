# dev.tfvars

# AWS region for the development environment
aws_region = "us-west-2"

# Public and private subnet CIDR blocks
public_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnets = ["10.0.3.0/24", "10.0.4.0/24"]

# EC2 instance type for your application servers
instance_type = "t2.micro"

# Number of EC2 instances for your application servers
app_instance_count = 2

# RDS DB instance class
db_instance_class = "db.t2.micro"

# Allocated storage for the RDS DB instance (in GB)
db_allocated_storage = 20


