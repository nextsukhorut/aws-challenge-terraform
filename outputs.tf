output "iam_group_name" {
  description = "Name of the IAM group created for this challenge."
  value       = aws_iam_group.challenge.name
}

output "iam_policy_arn" {
  description = "ARN of the custom IAM policy created for S3 write access."
  value       = aws_iam_policy.s3_write.arn
}

output "iam_role_name" {
  description = "Name of the IAM role trusted by EC2."
  value       = aws_iam_role.ec2.name
}

output "iam_instance_profile_name" {
  description = "Name of the IAM instance profile associated with the IAM role."
  value       = aws_iam_instance_profile.ec2.name
}
