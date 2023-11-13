# Create an SSH key pair
resource "aws_key_pair" "my_key_pair" {
  key_name   = var.key_name
  public_key = file(var.public_key_path)
}

# Example of using the key pair in an EC2 instance:
resource "aws_instance" "example" {
  ami           = var.ami
  instance_type = var.instance_type
  key_name      = aws_key_pair.my_key_pair.key_name
  # other instance configuration...
}