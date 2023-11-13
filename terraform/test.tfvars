# test.tfvars

# AWS region for the test environment
aws_region = "eu-west-2"

# Public and private subnet CIDR blocks
public_subnets = ["10.0.13.0/24", "10.0.14.0/24"]
private_subnets = ["10.0.15.0/24", "10.0.16.0/24"]

# EC2 instance type for your application servers
instance_type = "t3.small"

# Number of EC2 instances for your application servers
app_instance_count = 1

# RDS DB instance class
db_instance_class = "db.t3.micro"

# Allocated storage for the RDS DB instance (in GB)
db_allocated_storage = 10


