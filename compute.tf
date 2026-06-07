locals {
  required_tags = {
    Terraform = "true"
    Project   = var.project_id
  }
}

resource "aws_instance" "ec2_instance" {
  ami                    = data.aws_ami.amazon_linux_2023.id
  instance_type          = "t3.micro"
  subnet_id              = data.aws_subnet.public.id
  vpc_security_group_ids = [data.aws_security_group.selected.id]

  tags = merge(local.required_tags, {
    Name = var.ec2_instance_name
  })
}
