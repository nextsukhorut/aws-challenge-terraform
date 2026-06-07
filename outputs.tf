output "instance_id" {
  description = "ID of the EC2 instance created from remote state infrastructure."
  value       = aws_instance.remote_state.id
}

output "instance_public_ip" {
  description = "Public IP address of the EC2 instance created from remote state infrastructure."
  value       = aws_instance.remote_state.public_ip
}

output "remote_state_vpc_id" {
  description = "VPC ID read from the remote Landing Zone state."
  value       = data.terraform_remote_state.base_infra.outputs.vpc_id
}
