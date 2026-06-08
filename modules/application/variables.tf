variable "project_id" {
  description = "Project identifier used for required resource tags."
  type        = string
}

variable "vpc_id" {
  description = "ID of the VPC where application resources are deployed."
  type        = string
}

variable "subnet_ids" {
  description = "Public subnet IDs used by the load balancer and Auto Scaling Group."
  type        = list(string)
}

variable "ssh_security_group_id" {
  description = "Security group ID that allows SSH access to EC2 instances."
  type        = string
}

variable "public_http_security_group_id" {
  description = "Security group ID used by the Application Load Balancer."
  type        = string
}

variable "private_http_security_group_id" {
  description = "Security group ID that allows HTTP access from the load balancer to EC2 instances."
  type        = string
}

variable "aws_launch_template_name" {
  description = "Name of the launch template."
  type        = string
}

variable "aws_asg_name" {
  description = "Name of the Auto Scaling Group."
  type        = string
}

variable "load_balancer_name" {
  description = "Name of the Application Load Balancer."
  type        = string
}

variable "target_group_name" {
  description = "Name of the target group."
  type        = string
}

variable "ami_id" {
  description = "Amazon Machine Image ID used by the launch template."
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type used by the launch template."
  type        = string
}

variable "desired_capacity" {
  description = "Desired capacity for the Auto Scaling Group."
  type        = number
}

variable "min_size" {
  description = "Minimum size for the Auto Scaling Group."
  type        = number
}

variable "max_size" {
  description = "Maximum size for the Auto Scaling Group."
  type        = number
}
