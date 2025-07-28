variable "region" {
  description = "Región de AWS donde se desplegarán los recursos"
  type        = string
  default     = "us-east-1"
}

variable "secret_username" {
  description = "Nombre de usuario secreto"
  type        = string
  default     = "admin"
}

variable "secret_password" {
  description = "Contraseña secreta"
  type        = string
  sensitive   = true
}