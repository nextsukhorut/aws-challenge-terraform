# AWS Challenge Terraform

Local helper repository for the AWS IaC with Terraform challenge.

## Current Task

AWS IaC with Terraform: Import an Existing IAM Policy.

## Current Repository Settings

- Repository URL: `https://github.com/nextsukhorut/aws-challenge-terraform.git`
- Branch: `main`
- Repository folder for Syndicate: `.`

## Current Task Parameters

- Working directory: `tf_code`
- State bucket: `cmtr-t5hlnn4c-backend-bucket-1780898237`
- State key: `tf_code.tfstate`
- AWS region: `eu-west-1`
- IAM policy name: `cmtr-t5hlnn4c-iam-policy`
- Terraform resource: `aws_iam_policy.custom_policy`

## Commands

Run from the repository root:

```powershell
cd .\tf_code
terraform init -backend-config='bucket=cmtr-t5hlnn4c-backend-bucket-1780898237' -backend-config='key=tf_code.tfstate' -backend-config='region=eu-west-1'
terraform import aws_iam_policy.custom_policy <policy-arn>
terraform plan
```

The final `terraform plan` must show no unexpected infrastructure changes.
