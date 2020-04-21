
output "vpc_id" {
  value = aws_vpc.vpc.id
}

output "public_subnets" {
  value = [aws_subnet.public_subnet.id, aws_subnet.second_public_subnet.id]
}

output "private_subnets" {
  value = [aws_subnet.private_subnet.id, aws_subnet.second_private_subnet.id]
}
