output "vpc_id" {
  description = "ID of the VPC created by this module."
  value       = aws_vpc.this.id
}

output "subnet_ids" {
  description = "IDs of the public subnets created by this module."
  value       = aws_subnet.public[*].id
}
