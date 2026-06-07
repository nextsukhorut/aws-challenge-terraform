aws_region = "eu-west-1"

project_id = "cmtr-t5hlnn4c"

vpc_name = "cmtr-t5hlnn4c-vpc"

public_subnet_cidr_blocks = [
  "10.0.1.0/24",
  "10.0.3.0/24"
]

ssh_inbound_name     = "cmtr-t5hlnn4c-ec2_sg"
http_inbound_name    = "cmtr-t5hlnn4c-http_sg"
lb_http_inbound_name = "cmtr-t5hlnn4c-sglb"

iam_instance_profile = "cmtr-t5hlnn4c-instance_profile"
key_name             = "cmtr-t5hlnn4c-keypair"

aws_launch_template_name = "cmtr-t5hlnn4c-template"
aws_asg_name             = "cmtr-t5hlnn4c-asg"
load_balancer_name       = "cmtr-t5hlnn4c-loadbalancer"
