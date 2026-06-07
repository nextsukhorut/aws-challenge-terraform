variable "aws_region" {
  description = "AWS region where Terraform should operate."
  type        = string
}

variable "project_id" {
  description = "Project identifier used as the required Project tag value."
  type        = string
}

variable "bucket_name" {
  description = "Name of the pre-created S3 bucket used in the IAM policy."
  type        = string
}

variable "iam_group_name" {
  description = "Name of the IAM group to create."
  type        = string
}

variable "iam_policy_name" {
  description = "Name of the custom IAM policy to create."
  type        = string
}

variable "iam_role_name" {
  description = "Name of the IAM role trusted by EC2."
  type        = string
}

variable "iam_instance_profile_name" {
  description = "Name of the IAM instance profile associated with the EC2 role."
  type        = string
}
