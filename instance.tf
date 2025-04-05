provider "aws" {
    region = "us-east-2"     
}
resource "aws_instance" "myec2" {
    ami ="ami-0100e595e1cc1ff7f"
    key_name = "ohio-key"
    instance_type = "t2.micro"
    subnet_id              = aws_subnet.pub_sub.id
    vpc_security_group_ids = [ aws_security_group.mysg1.id ]
    tags = {
      Name = "tag ak"
    }
  
}

