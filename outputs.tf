output "bucket_name" {
  description = "Name of the S3 bucket created for object storage."
  value       = aws_s3_bucket.storage.bucket
}

output "bucket_arn" {
  description = "ARN of the S3 bucket created for object storage."
  value       = aws_s3_bucket.storage.arn
}
