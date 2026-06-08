variable "aws_region" {
  description = "AWS region where Terraform should operate."
  type        = string
}

variable "project_id" {
  description = "Project identifier used for required resource tags."
  type        = string
}

variable "vpc_name" {
  description = "Name tag for the VPC created by the network module."
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC created by the network module."
  type        = string
}

variable "subnet_names" {
  description = "Names for the public subnets created by the network module."
  type        = list(string)
}

variable "subnet_cidrs" {
  description = "CIDR blocks for the public subnets created by the network module."
  type        = list(string)
}

variable "availability_zones" {
  description = "Availability zones where public subnets will be created."
  type        = list(string)
}

variable "internet_gateway_name" {
  description = "Name tag for the internet gateway created by the network module."
  type        = string
}

variable "route_table_name" {
  description = "Name tag for the public route table created by the network module."
  type        = string
}

variable "allowed_ip_range" {
  description = "CIDR ranges allowed to access SSH and the public HTTP load balancer."
  type        = list(string)
}

variable "ssh_security_group_name" {
  description = "Name of the SSH security group created by the network security module."
  type        = string
}

variable "public_http_security_group_name" {
  description = "Name of the public HTTP security group for the load balancer."
  type        = string
}

variable "private_http_security_group_name" {
  description = "Name of the private HTTP security group for EC2 instances."
  type        = string
}

variable "aws_launch_template_name" {
  description = "Name of the launch template created by the application module."
  type        = string
}

variable "aws_asg_name" {
  description = "Name of the Auto Scaling Group created by the application module."
  type        = string
}

variable "load_balancer_name" {
  description = "Name of the Application Load Balancer created by the application module."
  type        = string
}

variable "target_group_name" {
  description = "Name of the target group created for the Auto Scaling Group."
  type        = string
}

variable "ami_id" {
  description = "Amazon Machine Image ID used by the launch template."
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type used in the launch template."
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
