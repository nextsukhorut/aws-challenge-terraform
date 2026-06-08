aws_region = "eu-west-1"

project_id = "cmtr-t5hlnn4c"

vpc_name = "cmtr-t5hlnn4c-vpc"
vpc_cidr = "10.10.0.0/16"

subnet_names = [
  "cmtr-t5hlnn4c-subnet-public-a",
  "cmtr-t5hlnn4c-subnet-public-b",
  "cmtr-t5hlnn4c-subnet-public-c"
]

subnet_cidrs = [
  "10.10.1.0/24",
  "10.10.3.0/24",
  "10.10.5.0/24"
]

availability_zones = [
  "eu-west-1a",
  "eu-west-1b",
  "eu-west-1c"
]

internet_gateway_name = "cmtr-t5hlnn4c-igw"
route_table_name      = "cmtr-t5hlnn4c-rt"

allowed_ip_range = [
  "18.153.146.156/32",
  "37.54.199.150/32"
]

ssh_security_group_name          = "cmtr-t5hlnn4c-ssh-sg"
public_http_security_group_name  = "cmtr-t5hlnn4c-public-http-sg"
private_http_security_group_name = "cmtr-t5hlnn4c-private-http-sg"

aws_launch_template_name = "cmtr-t5hlnn4c-template"
aws_asg_name             = "cmtr-t5hlnn4c-asg"
load_balancer_name       = "cmtr-t5hlnn4c-lb"
target_group_name        = "cmtr-t5hlnn4c-target-group"

ami_id           = "ami-05af3290611073bb6"
instance_type    = "t3.micro"
desired_capacity = 2
min_size         = 2
max_size         = 2
