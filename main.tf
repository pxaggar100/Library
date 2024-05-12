provider "aws" {
    region = "us-east-1"  
}

resource "aws_instance" "foo" {
  ami           = "ami-0e8ad69da124219b7" # Susi Linux
  instance_type = "t2.micro"
  tags = {
      Name = "TF-Instance"
  }
}
