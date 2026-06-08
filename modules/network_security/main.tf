locals {
  required_tags = {
    Terraform = "true"
    Project   = var.project_id
  }
}

resource "aws_security_group" "ssh" {
  name        = var.ssh_security_group_name
  description = "Allow SSH access from approved CIDR ranges"
  vpc_id      = var.vpc_id

  tags = merge(local.required_tags, {
    Name = var.ssh_security_group_name
  })
}

resource "aws_security_group_rule" "ssh_ingress" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = var.allowed_ip_range
  security_group_id = aws_security_group.ssh.id
  description       = "Allow SSH from approved CIDR ranges"
}

resource "aws_security_group_rule" "ssh_egress" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.ssh.id
  description       = "Allow all outbound traffic"
}

resource "aws_security_group" "public_http" {
  name        = var.public_http_security_group_name
  description = "Allow public HTTP access to the load balancer"
  vpc_id      = var.vpc_id

  tags = merge(local.required_tags, {
    Name = var.public_http_security_group_name
  })
}

resource "aws_security_group_rule" "public_http_ingress" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = var.allowed_ip_range
  security_group_id = aws_security_group.public_http.id
  description       = "Allow HTTP from approved CIDR ranges"
}

resource "aws_security_group_rule" "public_http_egress" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.public_http.id
  description       = "Allow all outbound traffic"
}

resource "aws_security_group" "private_http" {
  name        = var.private_http_security_group_name
  description = "Allow HTTP access from the public HTTP security group"
  vpc_id      = var.vpc_id

  tags = merge(local.required_tags, {
    Name = var.private_http_security_group_name
  })
}

resource "aws_security_group_rule" "private_http_ingress" {
  type                     = "ingress"
  from_port                = 80
  to_port                  = 80
  protocol                 = "tcp"
  source_security_group_id = aws_security_group.public_http.id
  security_group_id        = aws_security_group.private_http.id
  description              = "Allow HTTP from the load balancer security group"
}

resource "aws_security_group_rule" "private_http_egress" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.private_http.id
  description       = "Allow all outbound traffic"
}
