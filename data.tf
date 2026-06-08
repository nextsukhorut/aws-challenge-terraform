data "aws_vpc" "selected" {
  filter {
    name   = "tag:Name"
    values = [var.vpc_name]
  }
}

data "aws_subnet" "public" {
  for_each = toset(var.public_subnet_names)

  filter {
    name   = "tag:Name"
    values = [each.value]
  }

  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.selected.id]
  }
}

data "aws_security_group" "ssh" {
  name   = var.ssh_security_group_name
  vpc_id = data.aws_vpc.selected.id
}

data "aws_security_group" "http" {
  name   = var.http_security_group_name
  vpc_id = data.aws_vpc.selected.id
}

data "aws_security_group" "load_balancer" {
  name   = var.lb_security_group_name
  vpc_id = data.aws_vpc.selected.id
}

data "aws_ami" "amazon_linux_2023" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023.*-x86_64"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}
