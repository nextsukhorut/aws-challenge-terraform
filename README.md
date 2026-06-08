# AWS Challenge Terraform

Local helper repository for the AWS IaC with Terraform challenge.

## Current Task

AWS IaC with Terraform: Modular application deployment with network, network security, and application modules.

## Current Repository Settings

- Repository URL: `https://github.com/nextsukhorut/aws-challenge-terraform.git`
- Branch: `main`
- Repository folder for Syndicate: `.`

## Required Task Parameters

Replace the placeholder values in `terraform.tfvars` after the platform generates real values:

- `project_id`
- `vpc_name`
- `vpc_cidr`
- `subnet_names`
- `subnet_cidrs`
- `availability_zones`
- `internet_gateway_name`
- `route_table_name`
- `allowed_ip_range`
- `ssh_security_group_name`
- `public_http_security_group_name`
- `private_http_security_group_name`
- `aws_launch_template_name`
- `aws_asg_name`
- `load_balancer_name`
- `target_group_name`
- `ami_id`

## Commands

Run from the repository root:

```powershell
terraform init
terraform fmt -recursive
terraform validate
terraform plan
```

Before Syndicate verification, destroy any resources created during manual testing and push the final code.
