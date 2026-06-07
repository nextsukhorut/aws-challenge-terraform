variable "aws_region" {
  description = "AWS region where the network resources are created."
  type        = string
}

variable "vpc_name" {
  description = "Name tag for the VPC."
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC."
  type        = string
}

variable "subnet1_name" {
  description = "Name tag for the first public subnet."
  type        = string
}

variable "subnet1_cidr" {
  description = "CIDR block for the first public subnet."
  type        = string
}

variable "availability_zone1" {
  description = "Availability Zone for the first public subnet."
  type        = string
}

variable "subnet2_name" {
  description = "Name tag for the second public subnet."
  type        = string
}

variable "subnet2_cidr" {
  description = "CIDR block for the second public subnet."
  type        = string
}

variable "availability_zone2" {
  description = "Availability Zone for the second public subnet."
  type        = string
}

variable "subnet3_name" {
  description = "Name tag for the third public subnet."
  type        = string
}

variable "subnet3_cidr" {
  description = "CIDR block for the third public subnet."
  type        = string
}

variable "availability_zone3" {
  description = "Availability Zone for the third public subnet."
  type        = string
}

variable "internet_gateway_name" {
  description = "Name tag for the Internet Gateway."
  type        = string
}

variable "routing_table_name" {
  description = "Name tag for the public route table."
  type        = string
}
