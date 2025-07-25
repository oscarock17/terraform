# esto es un ejemplo de un archivo de Terraform que crea una instancia RDS en AWS
# Asegúrate de tener configurado tu proveedor de AWS y las credenciales necesarias
module "rds_instance" {
  source = "../module_rds"

  db_name                = "mydb"
  db_instance_class      = "db.t3.micro"
  allocated_storage      = 20 # GB
  username               = "--" # Reemplaza con un nombre de usuario válido
  password               = "--" # Reemplaza con una contraseña válida
  db_subnet_group_name   = "rds_sg"
  subnet_ids             = module.my_vpc.private_subnet_ids
  vpc_security_group_ids = [module.security_group_rds.security_group_id]
  skip_final_snapshot    = true
}