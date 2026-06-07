aws_region = "eu-west-1"

vpc_name = "cmtr-t5hlnn4c-01-vpc"
vpc_cidr = "10.10.0.0/16"

subnet1_name       = "cmtr-t5hlnn4c-01-subnet-public-a"
subnet1_cidr       = "10.10.1.0/24"
availability_zone1 = "eu-west-1a"

subnet2_name       = "cmtr-t5hlnn4c-01-subnet-public-b"
subnet2_cidr       = "10.10.3.0/24"
availability_zone2 = "eu-west-1b"

subnet3_name       = "cmtr-t5hlnn4c-01-subnet-public-c"
subnet3_cidr       = "10.10.5.0/24"
availability_zone3 = "eu-west-1c"

internet_gateway_name = "cmtr-t5hlnn4c-01-igw"
routing_table_name    = "cmtr-t5hlnn4c-01-rt"

common_tags = {
  ManagedBy = "Terraform"
  Project   = "AWS Challenge"
  Task      = "Creating Network Resources"
}
