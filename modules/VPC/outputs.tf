# VPC ID
output "vpc_id" {
  value = aws_vpc.eks_vpc.id
}

# ID of subnet in AZ1 
output "public_subnet_az1_id" {
  value = aws_subnet.public_subnet_az1.id
}

# ID of subnet in AZ2
output "public_subnet_az2_id" {
  value = aws_subnet.public_subnet_az2.id
}

# Internet Gateway ID
output "internet_gateway" {
  value = aws_internet_gateway.eks_internet_gateway.id
}

# ecr repository url
output "ecr_repository_url" {
  value       = aws_ecr_repository.prophius.repository_url
  description = "The URL of the ECR repository."
}

# db instance endpoint
output "db_instance_endpoint" {
  value       = aws_db_instance.prophius.endpoint
  description = "The endpoint of the RDS MySQL database."
}
# db instance username
output "db_instance_username" {
  value       = aws_db_instance.prophius.username
  description = "The username for the RDS MySQL database."
}
