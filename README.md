# AWS Challenge Terraform

Local helper repository for the AWS IaC with Terraform challenge.

## Current Task

AWS IaC with Terraform: Migrate S3 Backend State.

## Current Repository Settings

- Repository URL: `https://github.com/nextsukhorut/aws-challenge-terraform.git`
- Branch: `main`
- Repository folder for Syndicate: `.`

## Current Task Parameters

- Original state bucket: `cmtr-t5hlnn4c-backend-bucket-1780896786`
- New state bucket: `cmtr-t5hlnn4c-backend-new-bucket-1780896786`
- State key: `tf_code.tfstate`
- IAM policy resource: `aws_iam_policy.custom_policy`

## Common Commands

Use the scripts from PowerShell in this folder:

```powershell
.\scripts\check.ps1
.\scripts\tf.ps1 plan
.\scripts\push.ps1
```

The Terraform backend in `versions.tf` points to the new S3 bucket. The existing state must be migrated there with `terraform init -migrate-state`.

## Applied Terraform Practices

- AWS provider version is pinned exactly in `versions.tf`.
- All variables are declared only in `variables.tf` with `type` and `description`.
- The IAM policy resource is defined in `resources.tf`.
- The policy configuration matches the existing AWS resource and should produce no infrastructure changes after the state migration.
- No outputs are defined for this lab, so `terraform plan` remains clean after migration.
- Local state files, plan files, and `Token.md` are excluded from Git.
