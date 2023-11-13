# main.tf (staging)

# Define the VPC for the staging environment
resource "aws_vpc" "staging_vpc" {
  cidr_block = "10.1.0.0/16"
  enable_dns_support = true
  enable_dns_hostnames = true
  tags = {
    Name = "staging-vpc"
  }
}

# Create public and private subnets for staging
resource "aws_subnet" "staging_public_subnets" {
  count = 2
  vpc_id                  = aws_vpc.staging_vpc.id
  cidr_block              = "10.1.${count.index * 2}.0/24"
  availability_zone       = element(["eu-west-2a", "eu-west-2b"], count.index)
  map_public_ip_on_launch = true
  tags = {
    Name = "staging-public-subnet-${count.index}"
  }
}

resource "aws_subnet" "staging_private_subnets" {
  count = 2
  vpc_id                  = aws_vpc.staging_vpc.id
  cidr_block              = "10.1.${count.index * 2 + 1}.0/24"
  availability_zone       = element(["eu-west-2a", "eu-west-2b"], count.index)
  map_public_ip_on_launch = false
  tags = {
    Name = "staging-private-subnet-${count.index}"
  }
}

# Define a security group for the staging environment
resource "aws_security_group" "staging_sg" {
  name        = "staging-sg"
  description = "Staging Security Group"

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Define ingress rules as needed for the staging environment
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
    Name = "staging-sg"
  }
}

# Create an EC2 instance in the staging environment
resource "aws_instance" "staging_instance" {
  ami           = "ami-0c55b159cbfafe1f0" # Use your desired AMI ID
  instance_type = "t2.micro"
  subnet_id     = element(aws_subnet.staging_public_subnets[*].id, 0)
  security_groups = [aws_security_group.staging_sg.name]
  tags = {
    Name = "staging-instance"
  }
}

# Define an RDS database instance in the private subnet for staging
resource "aws_db_instance" "staging_db" {
  allocated_storage    = 50
  storage_type         = "gp2"
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t2.medium"
  name                 = "stagingdb"
  username             = "stagingdbuser"
  password             = "stagingdbpassword"
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot   = true
  vpc_security_group_ids = [aws_security_group.staging_sg.id]
  subnet_group_name     = "staging-db-subnet-group"
}

# Create an S3 bucket for the staging environment
resource "aws_s3_bucket" "staging_bucket" {
  bucket = "staging-bucket"
  acl    = "private"
}

# Additional resources and configurations as needed for your staging environment
