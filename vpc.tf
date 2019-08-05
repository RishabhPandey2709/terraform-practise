resource "aws_vpc" "default" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  tags = {
    Name = "test-vpc"
  }
}

resource "aws_subnet" "public-subnets" {
  count = length(var.public_azs)
  vpc_id            = aws_vpc.default.id
  cidr_block = element(var.public_cidr_blocks,count.index)
  availability_zone = element(var.public_azs,count.index)

  tags = {
    Name = "Web Public Subnet-${count.index+1}"
  }
}

resource "aws_subnet" "private-subnets" {
  count = length(var.pvt_azs)
  vpc_id            = aws_vpc.default.id
  cidr_block = element(var.private_cidr_blocks,count.index)
  availability_zone = element(var.pvt_azs,count.index)

  tags = {
    Name = "app server Private Subnet-${count.index+1}"
  }
}

# internet gateway creation
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.default.id

  tags = {
    Name = "VPC IGW"
  }
}

# elastic ip creation
resource "aws_eip" "eip" {
  vpc = true
}

# NAT GATWAY
resource "aws_nat_gateway" "gw" {
  allocation_id = aws_eip.eip.id
  subnet_id     = aws_subnet.public-subnets[0].id

  tags = {
    Name = "gw NAT"
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
resource "aws_route_table" "web-private-rt" {
  vpc_id = aws_vpc.default.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.gw.id
  }

  tags = {
    Name = "Public Subnet RT"
  }
}

# Assign route table to the public Subnet
resource "aws_route_table_association" "web-public-rt" {
  count = length(var.public_route_table)
  subnet_id      = aws_subnet.public-subnets[count.index].id
  route_table_id = aws_route_table.web-public-rt.id
}

# Assign route table to the private Subnet
resource "aws_route_table_association" "web-private-rt" {
  count = length(var.private_route_table)
  subnet_id      = aws_subnet.private-subnets[count.index].id
  route_table_id = aws_route_table.web-private-rt.id
}
