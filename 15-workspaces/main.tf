provider "aws" {
  region = var.region
  profile = var.profile
}

resource "aws_instance" "my_instance" {
  ami           = var.ami_id # Amazon Linux 2 (puedes cambiarlo)
  instance_type = var.instance_type
  subnet_id = var.subnet_id
  tags = {
    Name = "instance-${terraform.workspace}"
  }
}
