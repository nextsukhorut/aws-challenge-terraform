resource "aws_launch_template" "environment" {
  for_each = local.environments

  name          = each.value.launch_template_name
  image_id      = data.aws_ami.amazon_linux_2023.id
  instance_type = "t3.micro"
  user_data     = base64encode(templatefile("${path.module}/user_data.sh.tftpl", { environment = each.value.color }))

  network_interfaces {
    associate_public_ip_address = true
    delete_on_termination       = true
    security_groups             = [data.aws_security_group.ssh.id, data.aws_security_group.http.id]
  }

  tag_specifications {
    resource_type = "instance"
    tags = merge(local.required_tags, {
      Environment = each.value.color
    })
  }

  tag_specifications {
    resource_type = "volume"
    tags = merge(local.required_tags, {
      Environment = each.value.color
    })
  }

  tags = merge(local.required_tags, {
    Environment = each.value.color
  })
}

resource "aws_autoscaling_group" "environment" {
  for_each = local.environments

  name                = each.value.autoscaling_name
  desired_capacity    = 1
  min_size            = 1
  max_size            = 1
  target_group_arns   = [aws_lb_target_group.environment[each.key].arn]
  vpc_zone_identifier = local.public_subnet_ids

  health_check_grace_period = 120
  health_check_type         = "ELB"

  launch_template {
    id      = aws_launch_template.environment[each.key].id
    version = "$Latest"
  }

  tag {
    key                 = "Terraform"
    value               = "true"
    propagate_at_launch = true
  }

  tag {
    key                 = "Project"
    value               = var.project_id
    propagate_at_launch = true
  }

  tag {
    key                 = "Environment"
    value               = each.value.color
    propagate_at_launch = true
  }
}
