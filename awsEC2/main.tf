terraform {
provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "app_server" {
  ami             = "ami-07caf09b362be10b8"
  instance_type   = "t2.micro"
  security_groups = ["launch-wizard-1"]
  key_name        = "ps1"
  tags = {
    Name          = "AWEDEVPMTA059785"
    Environment   = "PMT-Dev"
    AppID         = "A059785"
    AppName       = "Payment System"
    AppOwner      = "Adam First name Last name "
    Email         = "Adam@bankofabcd.com"
    SLA           = "Platinum"
    Criticality   = "Tier1"
    Availability  = "Highest"
    ProvisionedBy = "tom.cook@icasfas.com"
  }
}
