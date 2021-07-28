###############################################################################
# Outputs - VPC
###############################################################################
output "codepipeline_id" {
  description = "The codepipeline ID."
  value       = module.ecr_pipeline.codepipeline_id
}

output "codepipeline_arn" {
  description = "The codepipeline ARN."
  value       = module.ecr_pipeline.codepipeline_arn
}

output "codebuild_project_id" {
  description = "ARN of the CodeBuild project."
  value       = module.ecr_pipeline.codebuild_project_id
}

output "codebuild_project_arn" {
  description = "ARN of the CodeBuild project."
  value       = module.ecr_pipeline.codebuild_project_arn
}

output "artifact_bucket_id" {
  description = "The name of the Artifact bucket."
  value       = module.ecr_pipeline.artifact_bucket_id
}

output "artifact_bucket_arn" {
  description = "The ARN of the Artifact bucket."
  value       = module.ecr_pipeline.artifact_bucket_arn
}
