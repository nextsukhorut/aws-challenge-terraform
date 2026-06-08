variable "project_id" {
  description = "Project identifier used for required resource tags."
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

variable "subnet_names" {
  description = "Names for the public subnets."
  type        = list(string)
}

variable "subnet_cidrs" {
  description = "CIDR blocks for the public subnets."
  type        = list(string)
}

variable "availability_zones" {
  description = "Availability zones for the public subnets."
  type        = list(string)
}

variable "internet_gateway_name" {
  description = "Name tag for the internet gateway."
  type        = string
}

variable "route_table_name" {
  description = "Name tag for the public route table."
  type        = string
}
