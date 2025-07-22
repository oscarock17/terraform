output "vpc_id" {
  description = "ID of the VPC"
  value       = aws_vpc.my-vpc.id
}

output "public_subnet_ids" {
  description = "IDs of the public subnets"
  value       = aws_subnet.public-subnet[*].id
}

output "private_subnet_ids" {
  description = "IDs of the private subnets"
  value       = aws_subnet.private-subnet[*].id
}
