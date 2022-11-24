resource "aws_instance" "citadel" {
  ami           = "ami-06178cf087598769c"
  instance_type = "m5.large"

  tags = {
    Name = "citadel"
  }
}

resource "aws_eip" "ip" {
  instance = aws_instance.citadel.id
  vpc      = true
}

resource "aws_vpc" "default" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.default.id
}




# data "aws_ami" "ubuntu" {
#   most_recent = true

#   filter {
#     name   = "name"
#     values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
#   }

#   filter {
#     name   = "virtualization-type"
#     values = ["hvm"]
#   }

#   owners = ["099720109477"] # Canonical
# }