# AWS Challenge Terraform

Local helper repository for the AWS IaC with Terraform challenge.

## Current Task

AWS IaC with Terraform: Blue-Green Deployment with Weighted ALB Routing.

## Current Repository Settings

- Repository URL: `https://github.com/nextsukhorut/aws-challenge-terraform.git`
- Branch: `main`
- Repository folder for Syndicate: `.`

## Required Task Parameters

Replace the placeholder values in `terraform.tfvars` after the platform generates real values:

- `project_id`
- `vpc_name`
- `public_subnet_names`
- `ssh_security_group_name`
- `http_security_group_name`
- `lb_security_group_name`
- `load_balancer_name`
- `blue_target_group_name`
- `green_target_group_name`
- `blue_launch_template_name`
- `green_launch_template_name`
- `blue_asg_name`
- `green_asg_name`

## Commands

Run from the repository root:

```powershell
terraform init
terraform fmt
terraform validate
terraform plan -var "blue_weight=100" -var "green_weight=0"
```

Before Syndicate verification, destroy any resources created during manual testing and push the final code.
