resource "aws_lb" "blue_green" {
  name               = var.load_balancer_name
  internal           = false
  load_balancer_type = "application"
  security_groups    = [data.aws_security_group.load_balancer.id]
  subnets            = local.public_subnet_ids

  tags = local.required_tags
}

resource "aws_lb_target_group" "environment" {
  for_each = local.environments

  name     = each.value.target_group_name
  port     = 80
  protocol = "HTTP"
  vpc_id   = data.aws_vpc.selected.id

  health_check {
    enabled             = true
    healthy_threshold   = 2
    interval            = 30
    matcher             = "200-399"
    path                = "/"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = 5
    unhealthy_threshold = 2
  }

  tags = merge(local.required_tags, {
    Environment = each.value.color
  })
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.blue_green.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type = "forward"

    forward {
      target_group {
        arn    = aws_lb_target_group.environment["blue"].arn
        weight = var.blue_weight
      }

      target_group {
        arn    = aws_lb_target_group.environment["green"].arn
        weight = var.green_weight
      }
    }
  }

  tags = local.required_tags
}
