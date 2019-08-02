resource "aws_vpc" "default" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true

  tags = {
    Name = "test-vpc"
  }
}

resource "aws_subnet" "public-subnet-01" {
  vpc_id            = aws_vpc.default.id
  cidr_block        = var.public_subnet_cidr_1
  availability_zone = "ap-southeast-1a"

  tags = {
    Name = "Web Public Subnet 01"
  }
}

resource "aws_subnet" "public-subnet-02" {
  vpc_id            = aws_vpc.default.id
  cidr_block        = var.public_subnet_cidr_2
  availability_zone = "ap-southeast-1b"

  tags = {
    Name = "Web Public Subnet 02"
  }
}

resource "aws_subnet" "private-subnet-01" {
  vpc_id            = aws_vpc.default.id
  cidr_block        = var.private_subnet_cidr_1
  availability_zone = "ap-southeast-1a"

  tags = {
    Name = "Database Private Subnet 01"
  }
}

resource "aws_subnet" "private-subnet-02" {
  vpc_id            = aws_vpc.default.id
  cidr_block        = var.private_subnet_cidr_2
  availability_zone = "ap-southeast-1a"

  tags = {
    Name = "app server Private Subnet 01"
  }
}

resource "aws_subnet" "private-subnet-03" {
  vpc_id            = aws_vpc.default.id
  cidr_block        = var.private_subnet_cidr_3
  availability_zone = "ap-southeast-1b"

  tags = {
    Name = "Database Private Subnet 02"
  }
}

resource "aws_subnet" "private-subnet-04" {
  vpc_id            = aws_vpc.default.id
  cidr_block        = var.private_subnet_cidr_4
  availability_zone = "ap-southeast-1b"

  tags = {
    Name = "app server Private Subnet 02"
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.default.id

  tags = {
    Name = "VPC IGW"
  }
}

resource "aws_route_table" "web-public-rt" {
  vpc_id = aws_vpc.default.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "Public Subnet RT"
  }
}

# Assign route table to the public Subnet
resource "aws_route_table_association" "web-public-rt-01" {
  subnet_id      = aws_subnet.public-subnet-01.id
  route_table_id = aws_route_table.web-public-rt.id
}

resource "aws_route_table_association" "web-public-rt-02" {
  subnet_id      = aws_subnet.public-subnet-02.id
  route_table_id = aws_route_table.web-public-rt.id
}

