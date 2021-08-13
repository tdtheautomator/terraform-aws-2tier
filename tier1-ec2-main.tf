#Creating EC2 Instnces
resource "aws_instance" "websrv1" {
  ami                    = var.tier1_ec2_ami_id
  instance_type          = var.tier1_ec2_size
  availability_zone      = var.az1_location
  vpc_security_group_ids = [aws_security_group.tier1-sg.id]
  subnet_id              = aws_subnet.subnet01.id
  key_name               = var.tier1_ec2_key_name
  user_data              = file("install_web.sh")
}

resource "aws_instance" "websrv2" {
  ami                    = var.tier1_ec2_ami_id
  instance_type          = var.tier1_ec2_size
  availability_zone      = var.az2_location
  vpc_security_group_ids = [aws_security_group.tier1-sg.id]
  subnet_id              = aws_subnet.subnet02.id
  key_name               = var.tier1_ec2_key_name
  user_data              = file("install_web.sh")
}