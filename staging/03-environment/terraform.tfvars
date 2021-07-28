###############################################################################
# Environment
###############################################################################
aws_account_id = "760965431264" ### PLEASE UPDATE THE AWS ACCOUNT NUMBER
environment    = "Staging"      ### PLEASE UPDATE YOUR ENVIRONMENT IF NEEDED
region         = "us-east-1" ### PLEASE UPDATE THE AWS REGION

###############################################################################
# VPC
###############################################################################
vpc_name                = "Staging VPC"
vpc_cidr                = "10.100.0.0/16"
map_public_ip_on_launch = true
public_cidr_a           = "10.100.10.0/24"
public_cidr_b           = "10.100.20.0/24"
private_cidr_a          = "10.100.96.0/21"
private_cidr_b          = "10.100.112.0/21"
data_cidr_a             = "10.100.192.0/21"
data_cidr_b             = "10.100.208.0/21"

###############################################################################
# Security Groups
###############################################################################
source_address_for_alb = "0.0.0.0/0" ### CIDR TO ALLOW ACCESS TO LOAD BALANCER

###############################################################################
# ALB
###############################################################################
alb_name     = "buamod-staging-alb"
alb_cert     = "arn:aws:acm:us-east-1:760965431264:certificate/8d40d07d-0cd8-4c1d-b2a8-63ca15b9a3b6"
app_name     = "cafu"
app_protocol = "HTTP"
app_port     = 80

###############################################################################
# ECS Cluster
###############################################################################
name_ecs                  = "buamod"
container_name_ecs        = "nginx"
container_port_ecs        = 80
desired_count_ecs         = 1
memory_ecs                = "1024"
cpu_ecs                   = "512"
container_definitions_ecs = <<EOF
[
  {
    "name": "nginx",
    "image": "760965431264.dkr.ecr.us-east-1.amazonaws.com/buamod-staging-repo:latest",
    "memory": 1024,
    "cpu": 512,
    "essential": true,
    "portMappings": [
      {
        "containerPort": 80,
        "hostPort": 80
      }
    ]
  }
]
EOF

###############################################################################
# RDS
###############################################################################
rds_name        = "aurora-cluster-demo"
rds_count       = 1
database_name   = "mydb"
master_username = "ronaldo"
engine          = "aurora-mysql"
engine_version  = "5.7.mysql_aurora.2.03.2"
instance_class  = "db.t3.medium"
