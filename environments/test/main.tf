# main.tf (test)

# Define the VPC for the test environment
resource "aws_vpc" "test_vpc" {
  cidr_block = "10.2.0.0/16"
  enable_dns_support = true
  enable_dns_hostnames = true
  tags = {
    Name = "test-vpc"
  }
}

# Create public and private subnets for test
resource "aws_subnet" "test_public_subnets" {
  count = 2
  vpc_id                  = aws_vpc.test_vpc.id
  cidr_block              = "10.2.${count.index * 2}.0/24"
  availability_zone       = element(["eu-west-2a", "eu-west-2b"], count.index)
  map_public_ip_on_launch = true
  tags = {
    Name = "test-public-subnet-${count.index}"
  }
}

resource "aws_subnet" "test_private_subnets" {
  count = 2
  vpc_id                  = aws_vpc.test_vpc.id
  cidr_block              = "10.2.${count.index * 2 + 1}.0/24"
  availability_zone       = element(["eu-west-2a", "eu-west-2b"], count.index)
  map_public_ip_on_launch = false
  tags = {
    Name = "test-private-subnet-${count.index}"
  }
}

# Define a security group for the test environment
resource "aws_security_group" "test_sg" {
  name        = "test-sg"
  description = "Test Security Group"

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Define ingress rules as needed for the test environment
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
    Name = "test-sg"
  }
}

# Create an EC2 instance in the test environment
resource "aws_instance" "test_instance" {
  ami           = "ami-0c55b159cbfafe1f0" # Use your desired AMI ID
  instance_type = "t2.micro"
  subnet_id     = element(aws_subnet.test_public_subnets[*].id, 0)
  security_groups = [aws_security_group.test_sg.name]
  tags = {
    Name = "test-instance"
  }
}

# Define an RDS database instance in the private subnet for testing
resource "aws_db_instance" "test_db" {
  allocated_storage    = 50
  storage_type         = "gp2"
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t2.micro"
  name                 = "testdb"
  username             = "testdbuser"
  password             = "testdbpassword"
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot   = true
  vpc_security_group_ids = [aws_security_group.test_sg.id]
  subnet_group_name     = "test-db-subnet-group"
}

# Create an S3 bucket for the test environment
resource "aws_s3_bucket" "test_bucket" {
  bucket = "test-bucket"
  acl    = "private"
}

# Additional resources and configurations as needed for your test environment
