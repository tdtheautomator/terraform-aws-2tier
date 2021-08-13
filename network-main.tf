# Creating VPC
resource "aws_vpc" "vpc-west" {
  cidr_block = var.vpc_cidr
}

# Tier1 Subnets (Frontend Web Layer)
resource "aws_subnet" "subnet01" {
  vpc_id                  = aws_vpc.vpc-west.id
  cidr_block              = var.subnet01_cidr
  availability_zone       = var.az1_location
  map_public_ip_on_launch = true
}

resource "aws_subnet" "subnet02" {
  vpc_id                  = aws_vpc.vpc-west.id
  cidr_block              = var.subnet02_cidr
  availability_zone       = var.az2_location
  map_public_ip_on_launch = true
}

# Tier3 Subnets (Backend Database Layer)
resource "aws_subnet" "subnet03" {
  vpc_id                  = aws_vpc.vpc-west.id
  cidr_block              = var.subnet03_cidr
  availability_zone       = var.az1_location
  map_public_ip_on_launch = false
}

resource "aws_subnet" "subnet04" {
  vpc_id                  = aws_vpc.vpc-west.id
  cidr_block              = var.subnet04_cidr
  availability_zone       = var.az2_location
  map_public_ip_on_launch = false
}

# Creating Internet Gateway
resource "aws_internet_gateway" "igw-tier1" {
  vpc_id = aws_vpc.vpc-west.id
}

# Create Route Table for Tier1 (Frontend Web Layer)
resource "aws_route_table" "rt-tier1" {
  vpc_id = aws_vpc.vpc-west.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw-tier1.id
  }
}

# Associate Subnets to Route Table
resource "aws_route_table_association" "rt-asc-subnet01" {
  subnet_id      = aws_subnet.subnet01.id
  route_table_id = aws_route_table.rt-tier1.id
}

resource "aws_route_table_association" "rt-asc-subnet02" {
  subnet_id      = aws_subnet.subnet02.id
  route_table_id = aws_route_table.rt-tier1.id
}
