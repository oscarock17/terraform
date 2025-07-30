provider "aws" {
  region = "us-east-1"
  profile = "dev"
}

resource "aws_security_group" "web_sg" {
  name        = "web_sg"
  description = "Allow HTTP inbound traffic"

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

resource "aws_instance" "web_server" {
  ami           = "ami-01edd5711cfe3825c" # Amazon Linux 2 AMI (verifica si sigue disponible)
  instance_type = "t2.micro"
  subnet_id = "subnet-0397ab85bb4a5dfed" # Reemplaza con tu subnet ID

  vpc_security_group_ids = [aws_security_group.web_sg.id]

  depends_on = [
    aws_security_group.web_sg
  ]

  tags = {
    Name = "WebServer"
  }
}
