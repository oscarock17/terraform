variable "region" {
  description = "La región donde se desplegarán los recursos"
  type        = string
}

variable "ami_id" {
  description = "ID de la AMI para la instancia EC2"
  type        = string
}

variable "instance_type" {
  description = "Tipo de instancia EC2"
  type        = string
  default     = "t2.micro"
}

variable "subnet_id" {
  description = "ID de la subnet donde se lanzará la instancia"
  type        = string
  default     = "" # Colocar el ID de una subnet donde se desea lanzar la instancia
}

variable "app_name" {
  description = "Nombre de la aplicación"
  type        = string
}

variable "db_password" {
  description = "La contraseña de la base de datos"
  type        = string
  sensitive   = true
}