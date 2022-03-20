#VCP
resource "aws_vpc" "myVpc" {
  cidr_block       = "10.0.0.0/16"
  tags = {
    Name = "AyaVpc"
  }
}

#subnet
resource "aws_subnet" "mySubnet" {
  vpc_id = aws_vpc.myVpc.id
  cidr_block = cidrsubnet(aws_vpc.myVpc.cidr_block, 4, 1)
  tags = {
    Name = "AyaSubnet"
  }
}

resource "aws_network_interface" "myNetInterface" {
  subnet_id = aws_subnet.mySubnet.id
  tags = {
    Name = "Aya"
  }
}

#security group
resource "aws_security_group" "mySG" {
  name = "AyaSG"
  vpc_id      = aws_vpc.myVpc.id
  tags = {
    Name = "Aya - Security Group"
  }
}

