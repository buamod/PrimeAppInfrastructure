###############################################################################
# Outputs - ECR
###############################################################################
output "ecr_arn" {
  description = "Full ARN of the repository"
  value       = module.ecr.arn
}

output "ecr_name" {
  description = "The name of the repository."
  value       = module.ecr.name
}

output "ecr_registry_id" {
  description = "The registry ID where the repository was created."
  value       = module.ecr.registry_id
}

output "ecr_repository_url" {
  description = "The URL of the repository (in the form `aws_account_id.dkr.ecr.region.amazonaws.com/repositoryName`)"
  value       = module.ecr.repository_url
}
