provider "aws" {
  region = var.region
  profile = "dev"
}

resource "aws_instance" "web" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id = "" #colocar el ID de una subnet donde se desea lanzar la instancia

  tags = {
    Name = "Terraform-EC2"
  }
}