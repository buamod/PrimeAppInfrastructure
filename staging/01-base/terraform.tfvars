###############################################################################
# Environment
###############################################################################
aws_account_id = "760965431264" ### PLEASE UPDATE THE AWS ACCOUNT NUMBER
environment    = "Staging"      ### PLEASE UPDATE YOUR ENVIRONMENT IF NEEDED
region         = "us-east-1" ### PLEASE UPDATE THE AWS REGION

###############################################################################
# ECR
###############################################################################
ecr_repo_name        = "buamod-staging-repo"
encryption_type      = "AES256"
scan_on_push         = true
image_tag_mutability = "IMMUTABLE"
