###############################################################################
# Terraform main config
###############################################################################
terraform {
  required_version = ">= 0.14"
  required_providers {
    aws = "~> 3.27.0"
  }
  backend "s3" {
    bucket  = "760965431264-build-state-bucket-buamod-staging"
    key     = "terraform.buamod-pipeline.tfstate"
    region  = "us-east-1"
    encrypt = "true"
  }
}

###############################################################################
# Providers
###############################################################################
provider "aws" {
  region              = var.region
  allowed_account_ids = [var.aws_account_id]
}

locals {
  tags = {
    Environment = var.environment
  }
}

###############################################################################
# Modules
###############################################################################
module "ecr_pipeline" {
  source = "../../modules/codepipeline"

  name               = var.name
  ecr_name           = var.ecr_name
  github_repo_owner  = var.github_repo_owner
  github_repo_name   = var.github_repo_name
  github_oauth_token = var.github_oauth_token
  tags = {
    Environment = var.environment
  }
}
