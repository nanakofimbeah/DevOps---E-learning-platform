output "key_name" {
  description = "Name of the SSH key pair"
  value       = aws_key_pair.my_key_pair.key_name
}
