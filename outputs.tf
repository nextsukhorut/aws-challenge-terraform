output "vpc_id" {
  description = "ID of the created VPC."
  value       = aws_vpc.main.id
}

output "public_subnet_ids" {
  description = "IDs of the created public subnets."
  value       = [for subnet in aws_subnet.public : subnet.id]
}

output "internet_gateway_id" {
  description = "ID of the created Internet Gateway."
  value       = aws_internet_gateway.main.id
}

output "public_route_table_id" {
  description = "ID of the created public route table."
  value       = aws_route_table.public.id
}
