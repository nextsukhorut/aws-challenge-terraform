aws_region = "eu-west-1"

policy_name        = "cmtr-t5hlnn4c-iam-policy"
policy_path        = "/"
policy_description = "Custom role with limited permissions"

policy_document = {
  Version = "2012-10-17"
  Statement = [
    {
      Effect = "Allow"
      Action = [
        "ec2:*",
        "s3:*"
      ]
      Resource = "*"
    }
  ]
}
