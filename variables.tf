variable "aws_region" {
  description = "AWS region where Terraform should operate."
  type        = string
}

variable "project_id" {
  description = "Project identifier used for required resource tags."
  type        = string
}

variable "vpc_name" {
  description = "Name tag of the pre-created VPC."
  type        = string
}

variable "public_subnet_names" {
  description = "Name tags of the pre-created public subnets."
  type        = list(string)
}

variable "ssh_security_group_name" {
  description = "Name of the pre-created security group for SSH access."
  type        = string
}

variable "http_security_group_name" {
  description = "Name of the pre-created security group for HTTP access to EC2 instances."
  type        = string
}

variable "lb_security_group_name" {
  description = "Name of the pre-created security group for HTTP access to the load balancer."
  type        = string
}

variable "load_balancer_name" {
  description = "Name of the Application Load Balancer."
  type        = string
}

variable "blue_target_group_name" {
  description = "Name of the Blue target group."
  type        = string
}

variable "green_target_group_name" {
  description = "Name of the Green target group."
  type        = string
}

variable "blue_launch_template_name" {
  description = "Name of the Blue launch template."
  type        = string
}

variable "green_launch_template_name" {
  description = "Name of the Green launch template."
  type        = string
}

variable "blue_asg_name" {
  description = "Name of the Blue Auto Scaling Group."
  type        = string
}

variable "green_asg_name" {
  description = "Name of the Green Auto Scaling Group."
  type        = string
}

variable "blue_weight" {
  description = "Traffic weight for the Blue target group."
  type        = number
}

variable "green_weight" {
  description = "Traffic weight for the Green target group."
  type        = number
}
