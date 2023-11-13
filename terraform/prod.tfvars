# prod.tfvars

# AWS region for the production environment
aws_region = "eu-west-2"

# Public and private subnet CIDR blocks
public_subnets = ["10.0.5.0/24", "10.0.6.0/24"]
private_subnets = ["10.0.7.0/24", "10.0.8.0/24"]

# EC2 instance type for your application servers
instance_type = "t3.large"

# Number of EC2 instances for your application servers
app_instance_count = 4

# RDS DB instance class
db_instance_class = "db.t3.medium"

# Allocated storage for the RDS DB instance (in GB)
db_allocated_storage = 100


