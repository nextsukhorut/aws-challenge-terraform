variable "aws_region" {
  description = "AWS region where the EC2 and SSH resources are created."
  type        = string
}

variable "project_id" {
  description = "Project identifier used to discover pre-created infrastructure and tag created resources."
  type        = string
}

variable "ssh_key" {
  description = "Provides custom public SSH key."
  type        = string
}

variable "aws_keypair_name" {
  description = "Name of the AWS key pair to create."
  type        = string
}

variable "aws_instance_name" {
  description = "Name tag for the EC2 instance."
  type        = string
}

variable "aws_security_group_name" {
  description = "Name of the pre-created security group that allows SSH access."
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type used for the SSH target instance."
  type        = string
}
