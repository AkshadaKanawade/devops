output "aws_instance_public_ip" {
  value = aws_instance.myec3.public_ip
}

output "vpc_id" {
  value = aws_vpc.spider_vpc.id
}
