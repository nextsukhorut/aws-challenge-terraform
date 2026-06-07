# AWS Challenge Terraform

Local helper repository for the AWS IaC with Terraform challenge.

## Current Task

AWS IaC with Terraform: Discover Existing Infrastructure with Data Sources.

## Current Repository Settings

- Repository URL: `https://github.com/nextsukhorut/aws-challenge-terraform.git`
- Branch: `main`
- Repository folder for Syndicate: `.`

## Required Task Parameters

Replace the placeholder values in `terraform.tfvars` after the platform generates real values:

- `project_id`
- `vpc_name`
- `public_subnet_name`
- `security_group_name`
- `ec2_instance_name`

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
- `data.tf` discovers the existing VPC, public subnet, security group, and latest Amazon Linux 2023 AMI.
- `compute.tf` creates one EC2 instance using only data source outputs for AMI, subnet, and security group values.
- No AWS VPC, subnet, security group, or AMI IDs are hardcoded in Terraform files.
- The EC2 instance uses the required `Terraform=true` and `Project=<project_id>` tags.
- Local state files, plan files, and `Token.md` are excluded from Git.

Not applied for this lab: remote backend, S3 state locking, and modules. The task explicitly requires the default local backend and is small enough to keep as a focused single-task configuration.
