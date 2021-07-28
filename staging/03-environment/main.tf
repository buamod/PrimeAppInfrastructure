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
    key     = "terraform.buamod-environment.tfstate"
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
module "vpc" {
  source = "../../modules/vpc"

  region                  = var.region
  environment             = var.environment
  vpc_name                = var.vpc_name
  vpc_cidr                = var.vpc_cidr
  map_public_ip_on_launch = var.map_public_ip_on_launch
  public_cidr_a           = var.public_cidr_a
  public_cidr_b           = var.public_cidr_b
  private_cidr_a          = var.private_cidr_a
  private_cidr_b          = var.private_cidr_b
  data_cidr_a             = var.data_cidr_a
  data_cidr_b             = var.data_cidr_b
  tags                    = local.tags

}

module "security_groups" {
  source = "../../modules/security_groups"

  vpc_id                 = module.vpc.vpc_id
  source_address_for_alb = var.source_address_for_alb

  tags = local.tags

}

module "alb" {
  source = "../../modules/alb"

  name               = var.alb_name
  load_balancer_type = "application"

  vpc_id          = module.vpc.vpc_id
  subnets         = module.vpc.public_subnets
  security_groups = [module.security_groups.alb_sg_id]

  target_groups = [
    {
      name_prefix      = "${var.app_name}-"
      backend_protocol = var.app_protocol
      backend_port     = var.app_port
      target_type      = "ip"
    },
  ]

  https_listeners = [
    {
      port               = 443
      protocol           = "HTTPS"
      certificate_arn    = var.alb_cert
      target_group_index = 0
    }
  ]

  http_tcp_listeners = [
    {
      port               = 80
      protocol           = "HTTP"
      target_group_index = 0
    }
  ]

  tags = local.tags
}

module "iam" {
  source = "../../modules/iam"

  tags = local.tags

}

module "ecs_fargate" {
  source = "../../modules/ecs_fargate"

  name = var.name_ecs
  tags = local.tags

  private_subnets  = module.vpc.private_subnets
  ecs_sg_id        = module.security_groups.ecs_sg_id
  target_group_arn = module.alb.target_group_arns[0]
  container_name   = var.container_name_ecs
  container_port   = var.container_port_ecs
  desired_count    = var.desired_count_ecs

  memory                = var.memory_ecs
  cpu                   = var.cpu_ecs
  task_role_arn         = module.iam.ecs_task_role_arn
  execution_role_arn    = module.iam.ecs_task_execution_role_arn
  container_definitions = var.container_definitions_ecs

}

module "rds" {
  source = "../../modules/rds"

  database_name   = var.database_name
  master_username = var.master_username
  engine          = var.engine
  engine_version  = var.engine_version
  rds_name        = var.rds_name
  rds_count       = var.rds_count
  instance_class  = var.instance_class
  environment     = var.environment
  rds_sg_id       = module.security_groups.rds_sg_id
  DB_subnetA      = module.vpc.data_subnet_a_id
  DB_subnetB      = module.vpc.data_subnet_b_id
  region          = var.region

  depends_on = [module.vpc]
}
