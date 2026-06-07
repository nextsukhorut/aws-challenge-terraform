variable "aws_region" {
  description = "AWS region where Terraform should operate."
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

variable "public_subnets" {
  description = "Public subnet definitions containing name, CIDR block, and Availability Zone."
  type = list(object({
    name              = string
    cidr_block        = string
    availability_zone = string
  }))
}

variable "internet_gateway_name" {
  description = "Name tag for the Internet Gateway."
  type        = string
}

variable "routing_table_name" {
  description = "Name tag for the public route table."
  type        = string
}
