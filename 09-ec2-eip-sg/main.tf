provider "aws" {
  region = var.region
  profile = var.profile
}

resource "aws_instance" "web" {
  ami           = var.ami
  instance_type = var.instance_type
  security_groups = [aws_security_group.web_sg.id]
  subnet_id = var.subnet_id

  tags = {
    Name = "WebServer"
  }
}

resource "aws_eip" "ip" {
  //instance = aws_instance.web.id
  domain  = "vpc"

  tags = {
    Name = "WebServerEIP"
  }
}

resource "aws_security_group" "web_sg" {
  name        = "web_sg"
  description = "Security group for web server"
  vpc_id      = var.vpc_id
}


resource "aws_vpc_security_group_ingress_rule" "ingress_http" {
  security_group_id = aws_security_group.web_sg.id

  cidr_ipv4   = "10.0.0.0/8"
  from_port   = 80
  ip_protocol = "tcp"
  to_port     = 80
}

resource "aws_vpc_security_group_ingress_rule" "ingress_ssh" {
  security_group_id = aws_security_group.web_sg.id

  cidr_ipv4   = "10.0.0.0/8"
  from_port   = 22
  ip_protocol = "tcp"
  to_port     = 22
}

resource "aws_vpc_security_group_egress_rule" "egress_rule" {
  security_group_id = aws_security_group.web_sg.id

  cidr_ipv4   = "0.0.0.0/0"
  from_port   = 0
  ip_protocol = "-1"
  to_port     = 0
}