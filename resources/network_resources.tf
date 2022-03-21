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

resource "aws_s3_bucket" "data" {
  # bucket is public
  # bucket is not encrypted
  # bucket does not have access logs
  # bucket does not have versioning
  bucket        = "${local.resource_prefix.value}-data"
  acl           = "public-read"
  force_destroy = true
  tags = merge({
    Name        = "${local.resource_prefix.value}-data"
    Environment = local.resource_prefix.value
    }, {
    git_commit           = "d68d2897add9bc2203a5ed0632a5cdd8ff8cefb0"
    git_file             = "terraform/aws/s3.tf"
    git_last_modified_at = "2020-06-16 14:46:24"
    git_last_modified_by = "nimrodkor@gmail.com"
    git_modifiers        = "nimrodkor"
    git_org              = "bridgecrewio"
    git_repo             = "terragoat"
    yor_trace            = "0874007d-903a-4b4c-945f-c9c233e13243"
  })
}
