output "ssh_security_group_id" {
  description = "ID of the security group that allows SSH and ICMP access."
  value       = aws_security_group.ssh.id
}

output "public_http_security_group_id" {
  description = "ID of the security group that allows public HTTP and ICMP access."
  value       = aws_security_group.public_http.id
}

output "private_http_security_group_id" {
  description = "ID of the security group that allows private HTTP and ICMP from the public HTTP security group."
  value       = aws_security_group.private_http.id
}
