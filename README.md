# AWS Challenge Terraform

Local helper repository for the AWS IaC with Terraform challenge.

## Current Task

AWS IaC with Terraform: Deploy Application Behind ALB.

## Current Repository Settings

- Repository URL: `https://github.com/nextsukhorut/aws-challenge-terraform.git`
- Branch: `main`
- Repository folder for Syndicate: `.`

## Required Task Parameters

Current generated task values are already defined in `terraform.tfvars`:

- `project_id`
- `vpc_name`
- `public_subnet_cidr_blocks`
- `ssh_inbound_name`
- `http_inbound_name`
- `lb_http_inbound_name`
- `iam_instance_profile`
- `key_name`
- `aws_launch_template_name`
- `aws_asg_name`
- `load_balancer_name`

## Common Commands

Use the scripts from PowerShell in this folder:

```powershell
.\scripts\check.ps1
.\scripts\tf.ps1 plan
.\scripts\tf.ps1 apply
.\scripts\tf.ps1 destroy
.\scripts\push.ps1
```

Before Syndicate verification, make sure AWS resources are destroyed and the latest Terraform code is pushed.

## Applied Terraform Practices

- AWS provider version is pinned exactly in `versions.tf`.
- All variables are declared only in `variables.tf` with `type` and `description`.
- Outputs are declared only in `outputs.tf` with descriptions.
- `application.tf` contains the launch template, Auto Scaling Group, load balancer, target group, listener, and ASG attachment.
- The launch template installs and starts Apache HTTP Server through user data.
- The startup script uses IMDSv2 to render instance ID and private IP address.
- Created resources use the required `Terraform=true` and `Project=<project_id>` tags.
- Local state files, plan files, and `Token.md` are excluded from Git.

Not applied for this lab: remote backend, S3 state locking, and modules. The task explicitly requires the default local backend and is small enough to keep as a focused single-task configuration.
