#Assign Variables

db_engine = "mysql"
db_engine_version = "8.0.20"
db_size = 5
db_instance_class = "db.t2.micro"
db_name = "appdb"
db_username = "dbadmin"
db_password = "xxxxxx"
tier1_ec2_size = "t2.micro"
tier1_ec2_ami_id = "ami-083ac7c7ecf9bb9b0"
tier1_ec2_key_name = "ec2-user"
az1_location = "us-west-2a"
az2_location = "us-west-2b"
vpc_cidr = "10.1.0.0/16"
subnet01_cidr = "10.1.1.0/24"
subnet02_cidr = "10.1.2.0/24"
subnet03_cidr = "10.1.3.0/24"
subnet04_cidr = "10.1.4.0/24"