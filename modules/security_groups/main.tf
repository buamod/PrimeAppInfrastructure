###############################################################################
# Security Groups - ALB
###############################################################################
resource "aws_security_group" "alb_security_group" {
  vpc_id      = var.vpc_id
  name_prefix = "alb-sg-"

  ingress {
    from_port   = 1
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = [var.source_address_for_alb]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(
    var.tags,
    map("Name", "alb-sg")
  )

  lifecycle {
    create_before_destroy = true
  }
}

###############################################################################
# Security Groups - ECS
###############################################################################
resource "aws_security_group" "ecs_security_group" {
  name_prefix = "ecs-sg-"
  description = "Allow ALB access to ECS"
  vpc_id      = var.vpc_id

  tags = merge(
    var.tags,
    map("Name", "ecs-sg")
  )

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_security_group_rule" "ecs_sg_egress_all" {
  type              = "egress"
  from_port         = 0
  to_port           = 65535
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.ecs_security_group.id
}

resource "aws_security_group_rule" "ecs_sg_ingress_all_alb" {
  type                     = "ingress"
  from_port                = 0
  to_port                  = 65535
  protocol                 = "-1"
  source_security_group_id = aws_security_group.alb_security_group.id
  security_group_id        = aws_security_group.ecs_security_group.id
  description              = "Allow ALB to access ECS"
}

###############################################################################
# Security Groups - RDS
###############################################################################
resource "aws_security_group" "rds_security_group" {
  name_prefix = "ecs-sg-"
  description = "Allow ECS access to RDS"
  vpc_id      = var.vpc_id

  tags = merge(
    var.tags,
    map("Name", "rds-sg")
  )

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_security_group_rule" "rds_sg_egress_all" {
  type              = "egress"
  from_port         = 0
  to_port           = 65535
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.rds_security_group.id
}

resource "aws_security_group_rule" "rds_sg_ingress_all_ecs" {
  type                     = "ingress"
  from_port                = 0
  to_port                  = 65535
  protocol                 = "-1"
  source_security_group_id = aws_security_group.ecs_security_group.id
  security_group_id        = aws_security_group.rds_security_group.id
  description              = "Allow ECS to access RDS"
}
