output "codebuild_project_id" {
  description = "ARN of the CodeBuild project."
  value       = aws_codebuild_project.project.id
}

output "codebuild_project_arn" {
  description = "ARN of the CodeBuild project."
  value       = aws_codebuild_project.project.arn
}

output "artifact_bucket_id" {
  description = "The name of the Artifact bucket."
  value       = aws_s3_bucket.artifact.id
}

output "artifact_bucket_arn" {
  description = "The ARN of the Artifact bucket."
  value       = aws_s3_bucket.artifact.arn
}
