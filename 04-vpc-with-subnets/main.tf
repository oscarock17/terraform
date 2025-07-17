provider "aws" {
  region  = var.region
  profile = var.profile
}

resource "aws_vpc" "my-vpc" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"

  tags = {
    Name = "terraform-test-vpc"
  }
}

data "aws_availability_zones" "available" {}

resource "aws_subnet" "public-subnet" {
  count      = var.public_subnet_count
  vpc_id     = aws_vpc.my-vpc.id
  #cidr_block = "10.0.${count.index + 1}.0/24"
  cidr_block = cidrsubnet(aws_vpc.my-vpc.cidr_block, 8, count.index + 1)
  availability_zone = data.aws_availability_zones.available.names[count.index]

  tags = {
    Name = "test-public-subnet-${count.index + 1}"
  }
}

resource "aws_subnet" "private-subnet" {
  count      = var.private_subnet_count
  vpc_id     = aws_vpc.my-vpc.id
  #cidr_block = "10.0.${count.index + 3}.0/24"
  cidr_block = cidrsubnet(aws_vpc.my-vpc.cidr_block, 8, count.index + 3)
  availability_zone = data.aws_availability_zones.available.names[count.index]

  tags = {
    Name = "test-private-subnet-${count.index + 1}"
  }
}

resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = aws_vpc.my-vpc.id

  tags = {
    Name = "internet-gateway"
  }
}

resource "aws_eip" "elastic_ip" {
  domain = "vpc"
}

resource "aws_nat_gateway" "nat_gateway" {
  allocation_id = aws_eip.elastic_ip.id
  subnet_id     = aws_subnet.public-subnet[0].id

  tags = {
    Name = "nat-gateway"
  }
}

resource "aws_route_table" "route_table_public" {
  vpc_id = aws_vpc.my-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet_gateway.id
  }

  tags = {
    Name = "route_table_public"
  }
}

resource "aws_route_table_association" "public-subnet-associations" {
  count          = 2
  subnet_id      = aws_subnet.public-subnet[count.index].id
  route_table_id = aws_route_table.route_table_public.id
}

resource "aws_route_table" "route_table_private" {
  vpc_id = aws_vpc.my-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat_gateway.id
  }

  tags = {
    Name = "route_table_private"
  }
}
resource "aws_route_table_association" "private-subnet-associations" {
  count          = 2
  subnet_id      = aws_subnet.private-subnet[count.index].id
  route_table_id = aws_route_table.route_table_private.id
}