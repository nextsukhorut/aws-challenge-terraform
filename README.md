# AWS Challenge Terraform

Local helper repository for the AWS IaC with Terraform challenge.

## Current Task

AWS IaC with Terraform: Configure Network Security.

## Current Repository Settings

- Repository URL: `https://github.com/nextsukhorut/aws-challenge-terraform.git`
- Branch: `main`
- Repository folder for Syndicate: `.`

## Required Task Parameters

Replace the placeholder values in `terraform.tfvars` after the platform generates real values:

- `project_id`
- `allowed_ip_range`
- `vpc_id`
- `public_subnet_id`
- `private_subnet_id`
- `public_instance_id`
- `private_instance_id`
- `ssh_security_group_name`
- `public_http_security_group_name`
- `private_http_security_group_name`

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
- Created security groups use the required tag: `Project=<project_id>`.
- Private HTTP access uses `source_security_group_id`, not CIDR blocks.
- Security groups are attached with `aws_network_interface_sg_attachment` so the platform security group is not removed.
- Local state files, plan files, and `Token.md` are excluded from Git.

Not applied for this lab: remote backend, S3 state locking, and modules. The task explicitly requires the default local backend and is small enough to keep as a focused single-task configuration.
