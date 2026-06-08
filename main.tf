provider "aws" {
  region = var.aws_region
}

module "network" {
  source = "./modules/network"

  project_id            = var.project_id
  vpc_name              = var.vpc_name
  vpc_cidr              = var.vpc_cidr
  subnet_names          = var.subnet_names
  subnet_cidrs          = var.subnet_cidrs
  availability_zones    = var.availability_zones
  internet_gateway_name = var.internet_gateway_name
  route_table_name      = var.route_table_name
}

module "network_security" {
  source = "./modules/network_security"

  project_id                       = var.project_id
  vpc_id                           = module.network.vpc_id
  allowed_ip_range                 = var.allowed_ip_range
  ssh_security_group_name          = var.ssh_security_group_name
  public_http_security_group_name  = var.public_http_security_group_name
  private_http_security_group_name = var.private_http_security_group_name
}

module "application" {
  source = "./modules/application"

  project_id                     = var.project_id
  vpc_id                         = module.network.vpc_id
  subnet_ids                     = module.network.subnet_ids
  ssh_security_group_id          = module.network_security.ssh_security_group_id
  public_http_security_group_id  = module.network_security.public_http_security_group_id
  private_http_security_group_id = module.network_security.private_http_security_group_id
  aws_launch_template_name       = var.aws_launch_template_name
  aws_asg_name                   = var.aws_asg_name
  load_balancer_name             = var.load_balancer_name
  target_group_name              = var.target_group_name
  ami_id                         = var.ami_id
  instance_type                  = var.instance_type
  desired_capacity               = var.desired_capacity
  min_size                       = var.min_size
  max_size                       = var.max_size
}
