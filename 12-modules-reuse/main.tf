provider "aws" {
  region = "us-east-1"
  profile = "dev"
}

module "my_vpc" {
  source = "../modules/module_vpc"

  vpc_cidr_block        = "10.0.0.0/16"
  vpc_name              = "terraform-test-vpc"
  dns_hostnames         = true
  public_subnet_count   = 2
  public_subnet_name    = "test-public-subnet"
  private_subnet_count  = 2
  private_subnet_name   = "test-private-subnet"
}

module "security_group" {
  source                      = "../modules/module_security_groups"
  security_group_name         = "private-instances-sg"
  security_group_description  = "Crea el security group para las instancias privadas"
  vpc_id                      = module.my_vpc.vpc_id

  ingress_rules = [
    {
      from_port   = 443
      to_port     = 443
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    },
    {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]

  egress_rules = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = "all"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]
}