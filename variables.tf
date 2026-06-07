variable "aws_region" {
  description = "AWS region where the S3 bucket is created."
  type        = string
}

variable "project_id" {
  description = "Project identifier used as the required Project tag value."
  type        = string
}

variable "bucket_name" {
  description = "Globally unique name of the S3 bucket to create."
  type        = string
}
