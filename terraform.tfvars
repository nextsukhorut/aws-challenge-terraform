aws_region = "eu-west-1"

vpc_name = "cmtr-t5hlnn4c-01-vpc"
vpc_cidr = "10.10.0.0/16"

public_subnets = [
  {
    name              = "cmtr-t5hlnn4c-01-subnet-public-a"
    cidr_block        = "10.10.1.0/24"
    availability_zone = "eu-west-1a"
  },
  {
    name              = "cmtr-t5hlnn4c-01-subnet-public-b"
    cidr_block        = "10.10.3.0/24"
    availability_zone = "eu-west-1b"
  },
  {
    name              = "cmtr-t5hlnn4c-01-subnet-public-c"
    cidr_block        = "10.10.5.0/24"
    availability_zone = "eu-west-1c"
  }
]

internet_gateway_name = "cmtr-t5hlnn4c-01-igw"
routing_table_name    = "cmtr-t5hlnn4c-01-rt"
