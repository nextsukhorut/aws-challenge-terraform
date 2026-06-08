aws_region = "eu-west-1"

project_id = "cmtr-t5hlnn4c"

vpc_name = "cmtr-t5hlnn4c-vpc"

public_subnet_names = [
  "cmtr-t5hlnn4c-public-subnet1",
  "cmtr-t5hlnn4c-public-subnet2"
]

ssh_security_group_name  = "cmtr-t5hlnn4c-sg-ssh"
http_security_group_name = "cmtr-t5hlnn4c-sg-http"
lb_security_group_name   = "cmtr-t5hlnn4c-sg-lb"

load_balancer_name = "cmtr-t5hlnn4c-lb"

blue_target_group_name  = "cmtr-t5hlnn4c-blue-tg"
green_target_group_name = "cmtr-t5hlnn4c-green-tg"

blue_launch_template_name  = "cmtr-t5hlnn4c-blue-template"
green_launch_template_name = "cmtr-t5hlnn4c-green-template"

blue_asg_name  = "cmtr-t5hlnn4c-blue-asg"
green_asg_name = "cmtr-t5hlnn4c-green-asg"

blue_weight  = 100
green_weight = 0
