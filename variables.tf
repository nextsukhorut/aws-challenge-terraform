variable "aws_region" {
  description = "AWS region where Terraform should operate."
  type        = string
}

variable "project_id" {
  description = "Project identifier used for required resource tags."
  type        = string
}

variable "state_bucket" {
  description = "S3 bucket name that stores the remote Terraform state."
  type        = string
}

variable "state_key" {
  description = "S3 object key path to the remote Terraform state file."
  type        = string
}
