provider "aws" {
  region = "us-east-2" 
}
resource "aws_instance" "myec1" {
  ami = "ami-01816d07b1128cd2d"
  key_name = "ohio-key.pem"
  instance_type =  "t2.micro"
  security_groups = [ "mysg1" ]
  subnet_id = aws_subnet.pub_sub.id
  tags = {
    Name = "spiderman instance"
  }
}