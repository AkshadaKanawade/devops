provider "aws" {
    region = "us-east-2"     
}
resource "aws_instance" "myec2" {
    ami ="ami-0100e595e1cc1ff7f"
    key_name = "ohio-key"
    instance_type = "t2.micro"
    vpc_security_group_ids = [ "mysg1" ]
    tags = {
      Name = "tag ak"
    }
  
}
# provider "aws" {
#     region = "us-east-1"
  
# }
# resource "aws_instance" "myec2" {
#     ami = "ami-0678bf8844b66f72a"
#     key_name = "demo"
#     instance_type = "t2.micro"
#     security_groups = ["sg"]
#     tags = {
#       Nmae = "Spiderma_instance"
#     }
  
# }