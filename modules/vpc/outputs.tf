###############################################################################
# Outputs - VPC
###############################################################################
output "vpc_id" {
  description = "The ID of the VPC."
  value       = aws_vpc.VPC.id
}

output "public_subnet_a_id" {
  description = "The ID of the Public Subnet A."
  value       = aws_subnet.PublicSubnetA.id
}

output "public_subnet_b_id" {
  description = "The ID of the Public Subnet B."
  value       = aws_subnet.PublicSubnetB.id
}

output "private_subnet_a_id" {
  description = "The ID of the Private Subnet A."
  value       = aws_subnet.PrivateSubnetA.id
}

output "private_subnet_b_id" {
  description = "The ID of the Private Subnet B."
  value       = aws_subnet.PrivateSubnetB.id
}

output "data_subnet_a_id" {
  description = "The ID of the Data Subnet A."
  value       = aws_subnet.DBPrivateSubnetA.id
}

output "data_subnet_b_id" {
  description = "The ID of the Data Subnet B."
  value       = aws_subnet.DBPrivateSubnetB.id
}

output "private_subnets" {
  description = "List of IDs of private subnets"
  value       = [aws_subnet.PrivateSubnetA.id, aws_subnet.PrivateSubnetB.id]
}

output "public_subnets" {
  description = "List of IDs of public subnets"
  value       = [aws_subnet.PublicSubnetA.id, aws_subnet.PublicSubnetB.id]
}

output "data_subnets" {
  description = "List of IDs of data subnets"
  value       = [aws_subnet.DBPrivateSubnetA.id, aws_subnet.DBPrivateSubnetB.id]
}
