aws_region = "eu-west-1"

project_id = "cmtr-t5hlnn4c"

allowed_ip_range = [
  "18.153.146.156/32",
  "37.54.199.150/32"
]

vpc_id            = "vpc-018ea9295fe6e1e5a"
public_subnet_id  = "subnet-0bd5eddc186049747"
private_subnet_id = "subnet-08fc5cf0e675e1e70"

public_instance_id  = "i-0d57e3dd183e250ee"
private_instance_id = "i-0605f01ee4cb71556"

ssh_security_group_name          = "cmtr-t5hlnn4c-ssh-sg"
public_http_security_group_name  = "cmtr-t5hlnn4c-public-http-sg"
private_http_security_group_name = "cmtr-t5hlnn4c-private-http-sg"
