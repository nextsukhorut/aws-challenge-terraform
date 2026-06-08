locals {
  required_tags = {
    Terraform = "true"
    Project   = var.project_id
  }

  user_data = <<-USERDATA
    #!/bin/bash
    set -euxo pipefail

    dnf update -y
    dnf install -y httpd python3 curl

    COMPUTE_MACHINE_UUID=$(cat /sys/devices/virtual/dmi/id/product_uuid | tr '[:upper:]' '[:lower:]')
    TOKEN=$(curl -X PUT "http://169.254.169.254/latest/api/token" -H "X-aws-ec2-metadata-token-ttl-seconds: 21600")
    COMPUTE_INSTANCE_ID=$(curl -H "X-aws-ec2-metadata-token: $${TOKEN}" http://169.254.169.254/latest/meta-data/instance-id)

    cat > /opt/app.env <<ENV
    COMPUTE_MACHINE_UUID=$${COMPUTE_MACHINE_UUID}
    COMPUTE_INSTANCE_ID=$${COMPUTE_INSTANCE_ID}
    ENV

    cat > /opt/app_server.py <<'PYTHON'
    import html
    import uuid
    from http.server import BaseHTTPRequestHandler, HTTPServer


    def read_env(path):
        values = {}
        with open(path, "r", encoding="utf-8") as env_file:
            for line in env_file:
                if "=" in line:
                    key, value = line.strip().split("=", 1)
                    values[key] = value
        return values


    class Handler(BaseHTTPRequestHandler):
        protocol_version = "HTTP/1.0"

        def do_GET(self):
            env = read_env("/opt/app.env")
            instance_id = html.escape(env.get("COMPUTE_INSTANCE_ID", "unknown"))
            response_uuid = html.escape(str(uuid.uuid4()))
            body = (
                "<html><body>"
                f"<p>This message was generated on instance {instance_id} "
                f"with the following UUID {response_uuid}</p>"
                "</body></html>"
            ).encode("utf-8")

            self.send_response(200)
            self.send_header("Content-Type", "text/html; charset=utf-8")
            self.send_header("Connection", "close")
            self.send_header("Content-Length", str(len(body)))
            self.end_headers()
            self.wfile.write(body)

        def log_message(self, format, *args):
            return


    HTTPServer(("0.0.0.0", 80), Handler).serve_forever()
    PYTHON

    cat > /etc/systemd/system/app-server.service <<SERVICE
    [Unit]
    Description=Instance metadata web application
    After=network-online.target
    Wants=network-online.target

    [Service]
    ExecStart=/usr/bin/python3 /opt/app_server.py
    Restart=always
    RestartSec=2

    [Install]
    WantedBy=multi-user.target
    SERVICE

    systemctl daemon-reload
    systemctl enable app-server
    systemctl start app-server
  USERDATA
}

resource "aws_launch_template" "this" {
  name          = var.aws_launch_template_name
  image_id      = var.ami_id
  instance_type = var.instance_type
  user_data     = base64encode(local.user_data)

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
