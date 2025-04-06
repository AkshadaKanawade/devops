resource "aws_security_group" "mysg1" {
  name        = "mysg1"
  description = "Allow SSH and HTTP"
  vpc_id      = aws_vpc.spider_vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
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

resource "aws_instance" "myec3" {
  ami           = "ami-01816d07b1128cd2d"
  key_name      = "ohio-key.pem"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.pub_sub.id
  security_groups = [aws_security_group.mysg1.name]

  tags = {
    Name = "spiderman instance"
  }
}
