###############################################################################
# Variables - Environment
###############################################################################
variable "aws_account_id" {
  description = "(Required) AWS Account ID."
}

variable "region" {
  description = "(Required) Region where resources will be created."
  default     = "ap-southeast-2"
}

variable "environment" {
  description = "(Optional) The name of the environment, e.g. Production, Development, etc."
  default     = "Development"
}

###############################################################################
# Variables - VPC
###############################################################################
variable "vpc_name" {
  description = "(Required) VPC Name."
}

variable "vpc_cidr" {
  description = "(Required) VPC CIDR block."
}

variable "map_public_ip_on_launch" {
  description = "(Optional) Specify true to indicate that instances launched into the subnet should be assigned a public IP address. Default is false."
}

variable "public_cidr_a" {
  description = "(Required) Public CIDR block A."
}

variable "public_cidr_b" {
  description = "(Required) Public CIDR block B."
}

variable "private_cidr_a" {
  description = "(Required) Private CIDR block A."
}

variable "private_cidr_b" {
  description = "(Required) Private CIDR block B."
}

variable "data_cidr_a" {
  description = "(Required) Data CIDR block A."
}

variable "data_cidr_b" {
  description = "(Required) Data CIDR block B."
}

###############################################################################
# Variables - Security Groups
###############################################################################
variable "source_address_for_alb" {
  description = "(Optional) The address to allow to communicate to the ALB."
  default     = "0.0.0.0/0"
}

###############################################################################
# Variables - ALB
###############################################################################
variable "alb_name" {
  description = "The resource name and Name tag of the load balancer."
}

variable "alb_cert" {
  description = "The ACM certificate to be used for ALB."
}

variable "app_name" {
  description = "The name of the Application Target Group."
}

variable "app_protocol" {
  description = "The protocol to be used by Application."
  default     = "HTTP"
}

variable "app_port" {
  description = "The port to be used by Application."
  default     = 80
}

###############################################################################
# Variables - ECS Fargate
###############################################################################
variable "name_ecs" {
  description = "Name of the app."
  type        = string
}

variable "container_name_ecs" {
  description = "The name of the container."
  type        = string
}

variable "container_port_ecs" {
  description = "The Port number for the container to use."
  type        = number
}

variable "desired_count_ecs" {
  description = "Desired number of tasks to run."
  type        = number
  default     = 1
}

variable "memory_ecs" {
  description = "Desired number of tasks to run."
  type        = string
  default     = "1024"
}

variable "cpu_ecs" {
  description = "Desired number of tasks to run."
  type        = string
  default     = "512"
}

variable "container_definitions_ecs" {
  description = "A list of valid container definitions provided as a single valid JSON document."
}

###############################################################################
# Variables - RDS
###############################################################################
variable "rds_name" {
  description = "Name of the RDS cluster."
}

variable "rds_count" {
  description = "Number of RDS instances to deploy."
}

variable "database_name" {
  description = "Database Name."
}

variable "master_username" {
  description = "Master Username for the Database."
}

variable "engine" {
  description = "Database Engine to use."
}

variable "engine_version" {
  description = "Database Engine version to use."
}

variable "instance_class" {
  description = "Database Instance class to use."
}
