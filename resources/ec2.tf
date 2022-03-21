resource "aws_instance" "myEc2Instance" {
  ami = "ami-047bb4163c506cd98"
  instance_type = "t2.micro"
  network_interface {
    device_index         = 0
    network_interface_id = aws_network_interface.myNetInterface.id
  }
  tags = {
    Name = "Aya EC2"
  }
  ebs_optimized = true
}