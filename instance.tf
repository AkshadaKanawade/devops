# Default provider (do not duplicate in vpc.tf)
provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "myec2_instance" {
  ami             = "ami-01816d07b1128cd2d"
  instance_type   = "t2.micro"
  key_name        = "id_rsa"
  security_groups = ["mysg1"]
  subnet_id       = aws_subnet.pub_sub.id

  tags = {
    Name = "spiderman instance"
  }
}

output "instance_public_ip" {
  value = aws_instance.myec2_instance.public_ip
}
