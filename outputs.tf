output "instance_id" {
  description = "ID of the EC2 instance created for SSH access."
  value       = aws_instance.ssh.id
}

output "instance_public_ip" {
  description = "Public IP address of the EC2 instance created for SSH access."
  value       = aws_instance.ssh.public_ip
}

output "key_pair_name" {
  description = "Name of the AWS key pair registered for SSH access."
  value       = aws_key_pair.ssh.key_name
}
