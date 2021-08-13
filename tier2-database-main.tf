resource "aws_db_instance" "default" {
  allocated_storage      = var.db_size
  db_subnet_group_name   = aws_db_subnet_group.default.id
  engine                 = var.db_engine
  engine_version         = var.db_engine_version
  instance_class         = var.db_instance_class
  multi_az               = true
  name                   = var.db_name
  username               = var.db_username
  password               = var.db_password
  skip_final_snapshot    = true
  vpc_security_group_ids = [aws_security_group.tier2-sg.id]
}

resource "aws_db_subnet_group" "default" {
  name       = "main"
  subnet_ids = [aws_subnet.subnet03.id, aws_subnet.subnet04.id]
}