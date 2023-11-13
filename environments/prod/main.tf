# main.tf

# Define the VPC for the production environment
resource "aws_vpc" "my_vpc" {
  cidr_block = "10.0.0.0/16"
  enable_dns_support = true
  enable_dns_hostnames = true
  tags = {
    Name = "my-prod-vpc"
  }
}

# Create public and private subnets
resource "aws_subnet" "public_subnets" {
  count = 2
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = "10.0.${count.index * 2}.0/24"
  availability_zone       = element(["eu-west-2a", "eu-west-2b"], count.index)
  map_public_ip_on_launch = true
  tags = {
    Name = "public-subnet-${count.index}"
  }
}

resource "aws_subnet" "private_subnets" {
  count = 2
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = "10.0.${count.index * 2 + 1}.0/24"
  availability_zone       = element(["eu-west-2a", "eu-west-2b"], count.index)
  map_public_ip_on_launch = false
  tags = {
    Name = "private-subnet-${count.index}"
  }
}

# Define a security group for the EC2 instances
resource "aws_security_group" "my_sg" {
  name        = "my-prod-sg"
  description = "My Prod Security Group"

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Define ingress rules as needed
  # For example, allow HTTP and HTTPS traffic:
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "my-prod-sg"
  }
}

# Create an EC2 instance in the public subnet
resource "aws_instance" "my_instance" {
  ami           = "ami-0c55b159cbfafe1f0" # Use your desired AMI ID
  instance_type = "t2.micro"
  subnet_id     = element(aws_subnet.public_subnets[*].id, 0)
  security_groups = [aws_security_group.my_sg.name]
  tags = {
    Name = "my-prod-instance"
  }
}

# Define an RDS database instance in the private subnet
resource "aws_db_instance" "my_db" {
  allocated_storage    = 100
  storage_type         = "gp2"
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t2.medium"
  name                 = "mydb"
  username             = "mydbuser"
  password             = "mydbpassword"
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot   = true
  vpc_security_group_ids = [aws_security_group.my_sg.id]
  subnet_group_name     = "my-db-subnet-group"
}

# Create an S3 bucket for the production environment
resource "aws_s3_bucket" "my_bucket" {
  bucket = "my-prod-bucket"
  acl    = "private"
}

# Additional resources and configurations as needed for your production environment
