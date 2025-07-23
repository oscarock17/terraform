# esto es un ejemplo de uso del modulo VPC
# Este archivo `example.tf` muestra cómo utilizar el módulo VPC creado en `module_vpc`.
module "my_vpc" {
  source = "../module_vpc" # Ruta al módulo VPC

  vpc_cidr_block        = "10.0.0.0/16"
  vpc_name              = "terraform-test-vpc"
  dns_hostnames         = true
  public_subnet_count   = 2
  public_subnet_name    = "test-public-subnet"
  private_subnet_count  = 2
  private_subnet_name   = "test-private-subnet"
}