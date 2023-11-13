# prod.tfvars

# AWS region for the production environment
aws_region = "eu-west-2"

# EC2 instance type for the production environment
instance_type = "t2.large"

# Number of EC2 instances to create
instance_count = 2

# RDS database engine for the production environment
db_engine = "postgresql"

# RDS database instance class for the production environment
db_instance_class = "db.m4.large"

# RDS allocated storage (in GB) for the production environment
db_allocated_storage = 50


