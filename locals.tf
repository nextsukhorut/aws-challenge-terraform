locals {
  public_subnet_ids = [for subnet in data.aws_subnet.public : subnet.id]

  required_tags = {
    Terraform = "true"
    Project   = var.project_id
  }

  environments = {
    blue = {
      color                = "Blue"
      target_group_name    = var.blue_target_group_name
      launch_template_name = var.blue_launch_template_name
      autoscaling_name     = var.blue_asg_name
    }
    green = {
      color                = "Green"
      target_group_name    = var.green_target_group_name
      launch_template_name = var.green_launch_template_name
      autoscaling_name     = var.green_asg_name
    }
  }
}
