variable "aws_region" {
  description = "AWS region where Terraform should operate."
  type        = string
}

variable "policy_name" {
  description = "Name of the existing IAM policy to import into Terraform state."
  type        = string
}

variable "policy_path" {
  description = "Path of the existing IAM policy to import into Terraform state."
  type        = string
}

variable "policy_description" {
  description = "Description of the existing IAM policy to import into Terraform state."
  type        = string
}

variable "policy_document" {
  description = "IAM policy document for the existing policy."
  type = object({
    Version = string
    Statement = list(object({
      Effect   = string
      Action   = list(string)
      Resource = string
    }))
  })
}
