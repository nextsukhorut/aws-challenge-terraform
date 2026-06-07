resource "aws_iam_policy" "custom_policy" {
  name        = var.policy_name
  path        = var.policy_path
  description = var.policy_description
  policy      = jsonencode(var.policy_document)
}
