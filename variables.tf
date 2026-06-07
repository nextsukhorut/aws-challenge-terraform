variable "aws_region" {
  description = "AWS region where Terraform should operate."
  type        = string
}

variable "project_id" {
  description = "Project identifier used for required resource tags."
  type        = string
}

variable "vpc_name" {
  description = "Name tag of the pre-created VPC to discover."
  type        = string
}

variable "public_subnet_name" {
  description = "Name tag of the pre-created public subnet to discover."
  type        = string
}

variable "security_group_name" {
  description = "Name tag of the pre-created security group to discover."
  type        = string
}

variable "ec2_instance_name" {
  description = "Name tag for the EC2 instance created by this task."
  type        = string
}
