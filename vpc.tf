# resource "aws_vpc" "my_vpc" {
#    cidr_block = "10.0.0.0/16"
#    tags = {
#    name = "myvpc"
#    env = "dev"
#  }
# }

# #subnet
# resource "aws_subnet" "pub_sub" {
#   vpc_id = aws_vpc.my_vpc.id
#   cidr_block = "10.0.0.0/20"
#   map_public_ip_on_launch = true
#   tags = {
#   name = "pubsubnet"
#   env = "dev"
#   }
# }

# resource "aws_subnet" "pvt_sub" {
#   vpc_id = aws_vpc.my_vpc.id
#   cidr_block = "10.0.1.0/20"
#   map_public_ip_on_launch = false
#   tags = {
#   name = "pvtsubnet"
#   env = "dev"
#   }  
# }

# resource "aws_internet_gateway" "myigw" {
#     vpc_id = aws_vpc.my_vpc
# }

# resource "aws_route_table" "myroutetable" {
#     vpc_id = aws_vpc.my_vpc
#     route = {
#         cidr_block = "10.0.1.0/24"
#         gateway_id = aws_internet_gateway.myigw.id
#     }
# }

# resource "aws_route_table_association" "routesubnet" {
#     subnet_id = aws_subnet.pub_sub
#     route_table_id = aws_route_table.myroutetable.id

# }


resource "aws_vpc" "my_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "myvpc"
    Env  = "dev"
  }
}

resource "aws_subnet" "pub_sub" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = "10.0.0.0/20"
  map_public_ip_on_launch = true
  availability_zone       = "us-east-1a" # optional but good to specify
  tags = {
    Name = "pubsubnet"
    Env  = "dev"
  }
}

resource "aws_subnet" "pvt_sub" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = "10.0.16.0/20"
  map_public_ip_on_launch = false
  availability_zone       = "us-east-1a"
  tags = {
    Name = "pvtsubnet"
    Env  = "dev"
  }
}

resource "aws_internet_gateway" "myigw" {
  vpc_id = aws_vpc.my_vpc.id
}

resource "aws_route_table" "myroutetable" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.myigw.id
  }
}

resource "aws_route_table_association" "routesubnet" {
  subnet_id      = aws_subnet.pub_sub.id
  route_table_id = aws_route_table.myroutetable.id
}


