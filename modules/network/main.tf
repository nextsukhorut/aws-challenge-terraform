locals {
  required_tags = {
    Terraform = "true"
    Project   = var.project_id
  }
}

resource "aws_vpc" "this" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = merge(local.required_tags, {
    Name = var.vpc_name
  })
}

resource "aws_subnet" "public" {
  count = length(var.subnet_names)

  vpc_id                  = aws_vpc.this.id
  cidr_block              = var.subnet_cidrs[count.index]
  availability_zone       = var.availability_zones[count.index]
  map_public_ip_on_launch = true

  tags = merge(local.required_tags, {
    Name = var.subnet_names[count.index]
  })
}

resource "aws_internet_gateway" "this" {
  vpc_id = aws_vpc.this.id

  tags = merge(local.required_tags, {
    Name = var.internet_gateway_name
  })
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.this.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.this.id
  }

  tags = merge(local.required_tags, {
    Name = var.route_table_name
  })
}

resource "aws_route_table_association" "public" {
  count = length(aws_subnet.public)

  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.public.id
}
