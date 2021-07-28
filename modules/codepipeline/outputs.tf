output "codepipeline_id" {
  description = "The codepipeline ID."
  value       = aws_codepipeline.pipeline.id
}

output "codepipeline_arn" {
  description = "The codepipeline ARN."
  value       = aws_codepipeline.pipeline.arn
}

output "codebuild_project_id" {
  description = "ARN of the CodeBuild project."
  value       = module.codebuild_project.codebuild_project_id
}

output "codebuild_project_arn" {
  description = "ARN of the CodeBuild project."
  value       = module.codebuild_project.codebuild_project_arn
}

output "artifact_bucket_id" {
  description = "The name of the Artifact bucket."
  value       = module.codebuild_project.artifact_bucket_id
}

output "artifact_bucket_arn" {
  description = "The ARN of the Artifact bucket."
  value       = module.codebuild_project.artifact_bucket_arn
}
