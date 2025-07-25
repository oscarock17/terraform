variable "db_subnet_group_name" {
  description = "Nombre de la subnet groups"
  type        = string
}

variable "subnet_ids" {
  description = "ID de las subnets"
}

variable "db_instance_identifier" {
  description = "Nombre de la instancia"
  type        = string
  default     = "terraform-db-test"
}

variable "db_name" {
  description = "Nombre de la base de datos"
  type        = string
  default     = "mydb"
}

variable "db_instance_class" {
  description = "Clase de instancia de la base de datos"
  type        = string
  default     = "db.t2.micro"
}

variable "allocated_storage" {
  description = "Espacio de almacenamiento asignado para la base de datos (GB)"
  type        = number
  default     = 20
}

variable "username" {
  description = "Nombre de usuario para la base de datos"
  type        = string
  default     = "admin"
}

variable "password" {
  description = "Contraseña para la base de datos"
  type        = string
  default     = "123456789aA"
}

variable "vpc_security_group_ids" {
  description = "IDs del security group db"
}

variable "skip_final_snapshot" {
  description = "desabilita el snapshot"
  type        = bool
  default     = true
}