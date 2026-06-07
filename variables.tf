variable "aws_region" {
  description = "AWS region where Terraform should operate."
  type        = string
}

variable "project_id" {
  description = "Project identifier used as the required Project tag value."
  type        = string
}

variable "allowed_ip_range" {
  description = "CIDR ranges allowed to access public infrastructure."
  type        = list(string)
}

variable "vpc_id" {
  description = "ID of the pre-created VPC where security groups are created."
  type        = string
}

variable "public_subnet_id" {
  description = "ID of the pre-created public subnet."
  type        = string
}

variable "private_subnet_id" {
  description = "ID of the pre-created private subnet."
  type        = string
}

variable "public_instance_id" {
  description = "ID of the pre-created public EC2 instance."
  type        = string
}

variable "private_instance_id" {
  description = "ID of the pre-created private EC2 instance."
  type        = string
}

variable "ssh_security_group_name" {
  description = "Name of the security group that allows SSH and ICMP from approved IP ranges."
  type        = string
}

variable "public_http_security_group_name" {
  description = "Name of the security group that allows public HTTP and ICMP access."
  type        = string
}

variable "private_http_security_group_name" {
  description = "Name of the security group that allows private HTTP and ICMP from the public HTTP security group."
  type        = string
}
