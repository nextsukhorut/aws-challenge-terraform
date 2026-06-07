locals {
  required_tags = {
    Project = var.project_id
  }
}

data "aws_instance" "public" {
  instance_id = var.public_instance_id
}

data "aws_instance" "private" {
  instance_id = var.private_instance_id
}

resource "aws_security_group" "ssh" {
  name        = var.ssh_security_group_name
  description = "Allow SSH and ICMP from approved IP ranges."
  vpc_id      = var.vpc_id

  tags = local.required_tags
}

resource "aws_security_group" "public_http" {
  name        = var.public_http_security_group_name
  description = "Allow public HTTP and ICMP from approved IP ranges."
  vpc_id      = var.vpc_id

  tags = local.required_tags
}

resource "aws_security_group" "private_http" {
  name        = var.private_http_security_group_name
  description = "Allow private HTTP and ICMP only from the public HTTP security group."
  vpc_id      = var.vpc_id

  tags = local.required_tags
}

resource "aws_security_group_rule" "ssh_ingress" {
  type              = "ingress"
  security_group_id = aws_security_group.ssh.id
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = var.allowed_ip_range
  description       = "Allow SSH from approved IP ranges."
}

resource "aws_security_group_rule" "ssh_icmp_ingress" {
  type              = "ingress"
  security_group_id = aws_security_group.ssh.id
  from_port         = -1
  to_port           = -1
  protocol          = "icmp"
  cidr_blocks       = var.allowed_ip_range
  description       = "Allow ICMP from approved IP ranges."
}

resource "aws_security_group_rule" "public_http_ingress" {
  type              = "ingress"
  security_group_id = aws_security_group.public_http.id
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = var.allowed_ip_range
  description       = "Allow HTTP from approved IP ranges."
}

resource "aws_security_group_rule" "public_http_icmp_ingress" {
  type              = "ingress"
  security_group_id = aws_security_group.public_http.id
  from_port         = -1
  to_port           = -1
  protocol          = "icmp"
  cidr_blocks       = var.allowed_ip_range
  description       = "Allow ICMP from approved IP ranges."
}

resource "aws_security_group_rule" "private_http_ingress" {
  type                     = "ingress"
  security_group_id        = aws_security_group.private_http.id
  from_port                = 8080
  to_port                  = 8080
  protocol                 = "tcp"
  source_security_group_id = aws_security_group.public_http.id
  description              = "Allow private HTTP from the public HTTP security group."
}

resource "aws_security_group_rule" "private_http_icmp_ingress" {
  type                     = "ingress"
  security_group_id        = aws_security_group.private_http.id
  from_port                = -1
  to_port                  = -1
  protocol                 = "icmp"
  source_security_group_id = aws_security_group.public_http.id
  description              = "Allow ICMP from the public HTTP security group."
}

resource "aws_network_interface_sg_attachment" "public_ssh" {
  security_group_id    = aws_security_group.ssh.id
  network_interface_id = data.aws_instance.public.network_interface_id
}

resource "aws_network_interface_sg_attachment" "public_http" {
  security_group_id    = aws_security_group.public_http.id
  network_interface_id = data.aws_instance.public.network_interface_id
}

resource "aws_network_interface_sg_attachment" "private_ssh" {
  security_group_id    = aws_security_group.ssh.id
  network_interface_id = data.aws_instance.private.network_interface_id
}

resource "aws_network_interface_sg_attachment" "private_http" {
  security_group_id    = aws_security_group.private_http.id
  network_interface_id = data.aws_instance.private.network_interface_id
}
