variable "aws_region" {
  description = "AWS region where Terraform should operate."
  type        = string
}

variable "project_id" {
  description = "Project identifier used for required resource tags."
  type        = string
}

variable "vpc_name" {
  description = "Name tag of the pre-created VPC where load balancer and target group resources are created."
  type        = string
}

variable "public_subnet_cidr_blocks" {
  description = "CIDR blocks of the pre-created public subnets used by the load balancer and Auto Scaling Group."
  type        = list(string)
}

variable "ssh_inbound_name" {
  description = "Name of the pre-created security group that allows SSH access to EC2 instances."
  type        = string
}

variable "http_inbound_name" {
  description = "Name of the pre-created security group that allows HTTP access to EC2 instances."
  type        = string
}

variable "lb_http_inbound_name" {
  description = "Name of the pre-created security group that allows HTTP access to the load balancer."
  type        = string
}

variable "iam_instance_profile" {
  description = "Name of the pre-created IAM instance profile attached to EC2 instances."
  type        = string
}

variable "key_name" {
  description = "Name of the pre-created key pair used for SSH access."
  type        = string
}

variable "aws_launch_template_name" {
  description = "Name of the launch template to create."
  type        = string
}

variable "aws_asg_name" {
  description = "Name of the Auto Scaling Group to create."
  type        = string
}

variable "load_balancer_name" {
  description = "Name of the Application Load Balancer to create."
  type        = string
}
