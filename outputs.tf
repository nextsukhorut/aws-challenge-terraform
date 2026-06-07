output "instance_id" {
  description = "ID of the EC2 instance created from discovered infrastructure values."
  value       = aws_instance.ec2_instance.id
}

output "instance_public_ip" {
  description = "Public IP address of the created EC2 instance."
  value       = aws_instance.ec2_instance.public_ip
}

output "discovered_vpc_id" {
  description = "ID of the VPC discovered by the aws_vpc data source."
  value       = data.aws_vpc.selected.id
}

output "discovered_subnet_id" {
  description = "ID of the public subnet discovered by the aws_subnet data source."
  value       = data.aws_subnet.public.id
}
