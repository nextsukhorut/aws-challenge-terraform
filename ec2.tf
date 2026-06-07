locals {
  required_tags = {
    Project = "epam-tf-lab"
    ID      = var.project_id
  }
}

data "aws_vpc" "selected" {
  filter {
    name   = "tag:Name"
    values = ["${var.project_id}-vpc"]
  }
}

data "aws_subnets" "public" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.selected.id]
  }

  filter {
    name   = "map-public-ip-on-launch"
    values = ["true"]
  }
}

data "aws_subnet" "public" {
  id = data.aws_subnets.public.ids[0]
}

data "aws_security_group" "ssh" {
  name   = var.aws_security_group_name
  vpc_id = data.aws_vpc.selected.id
}

data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_instance" "ssh" {
  ami                         = data.aws_ami.amazon_linux.id
  instance_type               = var.instance_type
  subnet_id                   = data.aws_subnet.public.id
  vpc_security_group_ids      = [data.aws_security_group.ssh.id]
  key_name                    = aws_key_pair.ssh.key_name
  associate_public_ip_address = true

  tags = merge(local.required_tags, {
    Name = var.aws_instance_name
  })
}
