#main.tf
#identify the provder as aws
provider "aws" {
  region     = "us-east-1"
  access_key = var.access_key
  secret_key = var.secret_key
}
# create RDS instance 
resource "aws_db_instance" "awedevmysqlpmt" {
  engine                 = "mysql"
  identifier             = "awedevmysqlpmt"
  allocated_storage      = 20
  engine_version         = "5.7"
  instance_class         = "db.t3.micro"
  skip_final_snapshot    = "true"
  publicly_accessible    = "true"
  username               = "pmtuser"
  password               = "password1"
  port                   = 3354
  vpc_security_group_ids = ["sg-0ad81ae2713b2376d"]
  tags = {
    Environment = "PMT-Dev"
    AppID       = "A059785"
    AppName     = "Payment System"
    AppOwner    = "Adam First name Last name "
    Email       = "Adam@bankofabcd.com"
  }
}
