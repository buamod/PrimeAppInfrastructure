###############################################################################
# Environment
###############################################################################
aws_account_id = "760965431264" ### PLEASE UPDATE THE AWS ACCOUNT NUMBER
environment    = "Staging"      ### PLEASE UPDATE YOUR ENVIRONMENT IF NEEDED
region         = "us-east-1" ### PLEASE UPDATE THE AWS REGION

###############################################################################
# CICD
###############################################################################
name               = "buamod"
ecr_name           = "buamod-staging-repo"
github_repo_owner  = "buamod"
github_repo_name   = "ecs-codeBuild-buildspec"
github_oauth_token = ""
