###############################################################################
# Outputs - VPC
###############################################################################
output "vpc_id" {
  description = "The ID of the VPC."
  value       = module.vpc.vpc_id
}

output "private_subnets" {
  description = "List of IDs of private subnets"
  value       = module.vpc.private_subnets
}

output "public_subnets" {
  description = "List of IDs of public subnets"
  value       = module.vpc.public_subnets
}

output "data_subnets" {
  description = "List of IDs of data subnets"
  value       = module.vpc.data_subnets
}

###############################################################################
# Outputs - Security Groups
###############################################################################
output "alb_sg_id" {
  description = "The ID of the ALB Security Group."
  value       = module.security_groups.alb_sg_id
}

output "ecs_sg_id" {
  description = "The ID of the ECS Security Group."
  value       = module.security_groups.ecs_sg_id
}

output "rds_sg_id" {
  description = "The ID of the RDS Security Group."
  value       = module.security_groups.rds_sg_id
}

###############################################################################
# Outputs - ALB
###############################################################################
output "this_lb_id" {
  description = "The ID and ARN of the load balancer we created."
  value       = module.alb.this_lb_id
}

output "this_lb_arn" {
  description = "The ID and ARN of the load balancer we created."
  value       = module.alb.this_lb_arn
}

output "this_lb_dns_name" {
  description = "The DNS name of the load balancer."
  value       = module.alb.this_lb_dns_name
}

output "target_group_arns" {
  description = "ARNs of the target groups. Useful for passing to your Auto Scaling group."
  value       = module.alb.target_group_arns
}

output "target_group_names" {
  description = "Name of the target group. Useful for passing to your CodeDeploy Deployment Group."
  value       = module.alb.target_group_names
}

###############################################################################
# Outputs - IAM
###############################################################################
output "ecs_task_execution_role_arn" {
  description = "The ARN for the ECS task execution role."
  value       = module.iam.ecs_task_execution_role_arn
}

output "ecs_task_role_arn" {
  description = "The ARN for the ECS task role."
  value       = module.iam.ecs_task_role_arn
}

###############################################################################
# Outputs - ECS Cluster
###############################################################################
output "ecs_cluster_arn" {
  description = "The Amazon Resource Name (ARN) that identifies the cluster."
  value       = module.ecs_fargate.ecs_cluster_arn
}

output "ecs_service_cluster" {
  description = "Amazon Resource Name (ARN) of cluster which the service runs on."
  value       = module.ecs_fargate.ecs_cluster_arn
}

output "ecs_service_id" {
  description = "ARN that identifies the service."
  value       = module.ecs_fargate.ecs_cluster_arn
}

output "ecs_service_name" {
  description = "Name of the service."
  value       = module.ecs_fargate.ecs_cluster_arn
}

output "ecs_td_arn" {
  description = "Full ARN of the Task Definition (including both family and revision)"
  value       = module.ecs_fargate.ecs_cluster_arn
}

output "ecs_td_family" {
  description = "The family of the Task Definition."
  value       = module.ecs_fargate.ecs_cluster_arn
}

output "ecs_td_revision" {
  description = "The revision of the Task Definition."
  value       = module.ecs_fargate.ecs_cluster_arn
}

###############################################################################
# RDS Output
###############################################################################
output "rds_cluster_id" {
  description = "The RDS Cluster Identifier."
  value       = module.rds.rds_cluster_id
}
