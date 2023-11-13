output "public_route_table_ids" {
  description = "IDs of the public route tables"
  value       = aws_route_table.my_rt[*].id
}
