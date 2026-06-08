variable "project_id" {
  description = "Project identifier used for required resource tags."
  type        = string
}

variable "vpc_id" {
  description = "ID of the VPC where security groups will be created."
  type        = string
}

variable "allowed_ip_range" {
  description = "CIDR ranges allowed to access SSH and public HTTP endpoints."
  type        = list(string)
}

variable "ssh_security_group_name" {
  description = "Name of the SSH security group."
  type        = string
}

variable "public_http_security_group_name" {
  description = "Name of the public HTTP security group."
  type        = string
}

variable "private_http_security_group_name" {
  description = "Name of the private HTTP security group."
  type        = string
}
