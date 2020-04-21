
resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = var.vpc_name
  }
}

# Public
resource "aws_subnet" "public_subnet" {
  cidr_block = var.public_cidr_range
  vpc_id     = aws_vpc.vpc.id

  availability_zone = var.availability_zones[0]
}

resource "aws_subnet" "second_public_subnet" {
  cidr_block = var.second_public_cidr_range
  vpc_id     = aws_vpc.vpc.id

  availability_zone = var.availability_zones[1]
}

resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.vpc.id
}

resource "aws_route_table_association" "public_association" {
  route_table_id = aws_route_table.public_route_table.id
  subnet_id      = aws_subnet.public_subnet.id
}

resource "aws_route_table_association" "second_public_association" {
  route_table_id = aws_route_table.public_route_table.id
  subnet_id      = aws_subnet.second_public_subnet.id
}

resource "aws_route" "public_route" {
  route_table_id         = aws_route_table.public_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.internet_access.id
}

resource "aws_internet_gateway" "internet_access" {
  vpc_id = aws_vpc.vpc.id
}

# Private
resource "aws_subnet" "private_subnet" {
  cidr_block = var.private_cidr_range
  vpc_id     = aws_vpc.vpc.id

  availability_zone = var.availability_zones[0]
}

resource "aws_subnet" "second_private_subnet" {
  cidr_block = var.second_private_cidr_range
  vpc_id     = aws_vpc.vpc.id

  availability_zone = var.availability_zones[1]
}

resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.vpc.id
}

resource "aws_route_table_association" "private_association" {
  route_table_id = aws_route_table.private_route_table.id
  subnet_id      = aws_subnet.private_subnet.id
}

resource "aws_route_table_association" "second_private_association" {
  route_table_id = aws_route_table.private_route_table.id
  subnet_id      = aws_subnet.second_private_subnet.id
}

resource "aws_route" "private_route" {
  route_table_id         = aws_route_table.private_route_table.id
  destination_cidr_block = "0.0.0.0/0"
}
