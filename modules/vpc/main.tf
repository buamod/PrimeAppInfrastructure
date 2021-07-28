###############################################################################
# Data Source
###############################################################################
data "aws_availability_zones" "available" {
  filter {
    name   = "region-name"
    values = [var.region]
  }
}

###############################################################################
# VPC
###############################################################################
resource "aws_vpc" "VPC" {
  cidr_block           = var.vpc_cidr
  instance_tenancy     = "default"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = merge(
    var.tags,
    map("Name", var.vpc_name)
  )
}

###############################################################################
# Subnets
###############################################################################
resource "aws_subnet" "PublicSubnetA" {
  vpc_id                  = aws_vpc.VPC.id
  cidr_block              = var.public_cidr_a
  availability_zone       = data.aws_availability_zones.available.names[0]
  map_public_ip_on_launch = var.map_public_ip_on_launch

  tags = merge(
    var.tags,
    map("Name", "Public Subnet A")
  )
}

resource "aws_subnet" "PublicSubnetB" {
  vpc_id                  = aws_vpc.VPC.id
  cidr_block              = var.public_cidr_b
  availability_zone       = data.aws_availability_zones.available.names[1]
  map_public_ip_on_launch = var.map_public_ip_on_launch

  tags = merge(
    var.tags,
    map("Name", "Public Subnet B")
  )
}

resource "aws_subnet" "PrivateSubnetA" {
  vpc_id            = aws_vpc.VPC.id
  cidr_block        = var.private_cidr_a
  availability_zone = data.aws_availability_zones.available.names[0]

  tags = merge(
    var.tags,
    map("Name", "Private Subnet A")
  )
}

resource "aws_subnet" "PrivateSubnetB" {
  vpc_id            = aws_vpc.VPC.id
  cidr_block        = var.private_cidr_b
  availability_zone = data.aws_availability_zones.available.names[1]

  tags = merge(
    var.tags,
    map("Name", "Private Subnet B")
  )
}

resource "aws_subnet" "DBPrivateSubnetA" {
  vpc_id            = aws_vpc.VPC.id
  cidr_block        = var.data_cidr_a
  availability_zone = data.aws_availability_zones.available.names[0]

  tags = merge(
    var.tags,
    map("Name", "Data Subnet A")
  )
}

resource "aws_subnet" "DBPrivateSubnetB" {
  vpc_id            = aws_vpc.VPC.id
  cidr_block        = var.data_cidr_b
  availability_zone = data.aws_availability_zones.available.names[1]

  tags = merge(
    var.tags,
    map("Name", "Data Subnet B")
  )
}

###############################################################################
# IGW
###############################################################################
resource "aws_internet_gateway" "IGW" {
  vpc_id = aws_vpc.VPC.id

  tags = merge(
    var.tags,
    map("Name", "igw-VPC")
  )
}

###############################################################################
# Route Table
###############################################################################
resource "aws_route_table" "RouteTablePublic" {
  vpc_id = aws_vpc.VPC.id

  tags = merge(
    var.tags,
    map("Name", "Public Route")
  )
}

resource "aws_route_table" "RouteTablePrivateA" {
  vpc_id = aws_vpc.VPC.id

  tags = merge(
    var.tags,
    map("Name", "Private Route A")
  )
}

resource "aws_route_table" "RouteTablePrivateB" {
  vpc_id = aws_vpc.VPC.id

  tags = merge(
    var.tags,
    map("Name", "Private Route B")
  )
}

###############################################################################
# EIP
###############################################################################
resource "aws_eip" "EIPNatA" {
  vpc = true
}

resource "aws_eip" "EIPNatB" {
  vpc = true
}

###############################################################################
# NATGW
###############################################################################
resource "aws_nat_gateway" "NATGatewaySubnetA" {
  allocation_id = aws_eip.EIPNatA.id
  subnet_id     = aws_subnet.PublicSubnetA.id

  tags = merge(
    var.tags,
    map("Name", "NAT Gateway 1")
  )
}

resource "aws_nat_gateway" "NATGatewaySubnetB" {
  allocation_id = aws_eip.EIPNatB.id
  subnet_id     = aws_subnet.PublicSubnetB.id

  tags = merge(
    var.tags,
    map("Name", "NAT Gateway 2")
  )
}

###############################################################################
# Route
###############################################################################
resource "aws_route" "RouteIGW" {
  route_table_id         = aws_route_table.RouteTablePublic.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.IGW.id
}

resource "aws_route" "RouteNatGatewayA" {
  route_table_id         = aws_route_table.RouteTablePrivateA.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.NATGatewaySubnetA.id
}

resource "aws_route" "RouteNatGatewayB" {
  route_table_id         = aws_route_table.RouteTablePrivateB.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.NATGatewaySubnetB.id
}

###############################################################################
# Table Association
###############################################################################
resource "aws_route_table_association" "RouteAssocPublicA" {
  subnet_id      = aws_subnet.PublicSubnetA.id
  route_table_id = aws_route_table.RouteTablePublic.id
}

resource "aws_route_table_association" "RouteAssocPublicB" {
  subnet_id      = aws_subnet.PublicSubnetB.id
  route_table_id = aws_route_table.RouteTablePublic.id
}

resource "aws_route_table_association" "RouteAssocPrivateA" {
  subnet_id      = aws_subnet.PrivateSubnetA.id
  route_table_id = aws_route_table.RouteTablePrivateA.id
}

resource "aws_route_table_association" "RouteAssocPrivateB" {
  subnet_id      = aws_subnet.PrivateSubnetB.id
  route_table_id = aws_route_table.RouteTablePrivateB.id
}

resource "aws_route_table_association" "DBRouteAssocPrivateA" {
  subnet_id      = aws_subnet.DBPrivateSubnetA.id
  route_table_id = aws_route_table.RouteTablePrivateA.id
}

resource "aws_route_table_association" "DBRouteAssocPrivateB" {
  subnet_id      = aws_subnet.DBPrivateSubnetB.id
  route_table_id = aws_route_table.RouteTablePrivateB.id
}
