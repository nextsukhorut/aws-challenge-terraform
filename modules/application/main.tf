locals {
  required_tags = {
    Terraform = "true"
    Project   = var.project_id
  }
}

resource "aws_launch_template" "this" {
  name          = var.aws_launch_template_name
  image_id      = var.ami_id
  instance_type = var.instance_type
  user_data     = filebase64("${path.module}/user_data.sh")

  metadata_options {
    http_endpoint = "enabled"
    http_tokens   = "required"
  }

  network_interfaces {
    associate_public_ip_address = true
    delete_on_termination       = true
    security_groups = [
      var.ssh_security_group_id,
      var.private_http_security_group_id
    ]
  }

  tag_specifications {
    resource_type = "instance"
    tags = merge(local.required_tags, {
      Name = var.aws_launch_template_name
    })
  }

  tag_specifications {
    resource_type = "volume"
    tags          = local.required_tags
  }

  tags = local.required_tags
}

resource "aws_lb" "this" {
  name               = var.load_balancer_name
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.public_http_security_group_id]
  subnets            = var.subnet_ids

  tags = local.required_tags
}

resource "aws_lb_target_group" "this" {
  name                              = var.target_group_name
  port                              = 80
  protocol                          = "HTTP"
  vpc_id                            = var.vpc_id
  deregistration_delay              = 0
  load_balancing_algorithm_type     = "round_robin"
  load_balancing_cross_zone_enabled = "true"

  health_check {
    enabled             = true
    healthy_threshold   = 2
    interval            = 5
    matcher             = "200-399"
    path                = "/"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = 2
    unhealthy_threshold = 2
  }

  tags = local.required_tags
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.this.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.this.arn
  }

  tags = local.required_tags
}

resource "aws_autoscaling_group" "this" {
  name                      = var.aws_asg_name
  desired_capacity          = var.desired_capacity
  min_size                  = var.min_size
  max_size                  = var.max_size
  vpc_zone_identifier       = var.subnet_ids
  health_check_type         = "ELB"
  health_check_grace_period = 60

  launch_template {
    id      = aws_launch_template.this.id
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

  lifecycle {
    ignore_changes = [
      load_balancers,
      target_group_arns
    ]
  }
}

resource "aws_autoscaling_attachment" "this" {
  autoscaling_group_name = aws_autoscaling_group.this.id
  lb_target_group_arn    = aws_lb_target_group.this.arn
}
