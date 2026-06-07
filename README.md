# AWS Challenge Terraform

Local helper repository for the AWS IaC with Terraform challenge.

## Current Task

AWS IaC with Terraform: Create Resources for SSH Authentication.

## Current Repository Settings

- Repository URL: `https://github.com/nextsukhorut/aws-challenge-terraform.git`
- Branch: `main`
- Repository folder for Syndicate: `.`

## Required Task Parameters

Replace the placeholder values in `terraform.tfvars` after the platform generates real values:

- `project_id`
- `aws_keypair_name`
- `aws_instance_name`
- `aws_security_group_name`

The SSH public key is not stored in the repository. It is loaded from `keys/aws-challenge-ssh.pub` by the helper scripts and passed as `TF_VAR_ssh_key`.

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
- Created resources use the required tags: `Project=epam-tf-lab` and `ID=<project_id>`.
- Local state files, plan files, and `Token.md` are excluded from Git.
- The SSH public key is passed via `TF_VAR_ssh_key`; it is not hardcoded in Terraform files.

Not applied for this lab: remote backend, S3 state locking, and modules. The task explicitly requires the default local backend and is small enough to keep as a focused single-task configuration.
