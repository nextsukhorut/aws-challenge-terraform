# AWS Challenge Terraform

Local helper repository for the AWS IaC with Terraform challenge.

## Current Task

AWS IaC with Terraform: Move a Resource Between Terraform State Files.

## Current Repository Settings

- Repository URL: `https://github.com/nextsukhorut/aws-challenge-terraform.git`
- Branch: `main`
- Repository folder for Syndicate: `.`

## Current Task Parameters

- State bucket: `cmtr-t5hlnn4c-backend-bucket-1780864102`
- Source directory: `tf_code_1`
- Destination directory: `tf_code_2`
- Source state key: `tf_code_1.tfstate`
- Destination state key: `tf_code_2.tfstate`
- IAM policy resource: `aws_iam_policy.custom_policy`
- IAM policy name: `resource-move-demo-policy`

## Common Commands

Use the scripts from PowerShell in this folder:

```powershell
.\scripts\check.ps1
.\scripts\push.ps1
```

Before Syndicate verification, make sure the IAM policy state is moved to `tf_code_2.tfstate` and the latest Terraform code is pushed.

## Applied Terraform Practices

- AWS provider version is pinned exactly in both Terraform directories.
- All variables are declared only in `variables.tf` with `type` and `description`.
- `tf_code_1` is the source configuration after the IAM policy resource was removed.
- `tf_code_2` is the destination configuration and manages `aws_iam_policy.custom_policy`.
- The IAM policy configuration matches the pre-created AWS resource and should produce no infrastructure changes after the state move.
- Local state files, plan files, and `Token.md` are excluded from Git.

This lab intentionally uses the provided S3 backend state files because the task is specifically about moving resource ownership between two Terraform state files.
