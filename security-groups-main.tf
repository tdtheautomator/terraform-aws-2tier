# Create Web Security Group
resource "aws_security_group" "elb-sg" {
  name        = "elb-sg"
  description = "Allow inbound web traffic to load balancer"
  vpc_id      = aws_vpc.vpc-west.id

  ingress {
    description = "Allow inbound web traffic to load balancer"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Create Web Server Security Group
resource "aws_security_group" "tier1-sg" {
  name        = "tier1-sg"
  description = "Allow inbound traffic"
  vpc_id      = aws_vpc.vpc-west.id

  ingress {
    description     = "Allow web traffic from load balancer"
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.elb-sg.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Create Tier 2 Security Group (Database Layer)
resource "aws_security_group" "tier2-sg" {
  name        = "tier2-sg"
  description = "Allow inbound traffic"
  vpc_id      = aws_vpc.vpc-west.id

  ingress {
    description     = "Allow traffic from tier1"
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = [aws_security_group.tier1-sg.id]
  }

  egress {
    from_port   = 32768
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

}