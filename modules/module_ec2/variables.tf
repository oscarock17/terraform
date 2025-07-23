variable "instance_count" {
  description = "Número de instancias a crear"
  type        = number
}

variable "ami_id" {
  description = "ID de la AMI a utilizar"
}

variable "instance_type" {
  description = "Tipo de instancia"
}

variable "subnet_ids" {
  description = "Lista de IDs de subredes donde desplegar las instancias"
  type        = list(string)
}

variable "iam_instance_profile" {
  description = "Nombre del perfil de instancia IAM"
}

variable "security_group_ids" {
  description = "Lista de IDs de grupos de seguridad"
  type        = list(string)
}

variable "instance_name" {
  description = "Prefijo del nombre de la instancia"
}

variable "user_data" {
  description = "User data script para ser ejecutado en la creacion de la instancia"
  type        = string
  default     = null
}

variable "tags_environment" {
  description = "Tag del entorno"
}
