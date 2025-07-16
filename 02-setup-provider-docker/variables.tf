#crear las variables en el terraform.tfvars
variable "github_token" {
  description = "GitHub personal access token with read:packages scope"
  type        = string
  sensitive   = true
}

variable "database_name" {
  description = "Name of the PostgreSQL database"
  type        = string
  sensitive   = true
}

variable "database_user" {
  description = "PostgreSQL database user"
  type        = string
  sensitive   = true
}

variable "database_password" {
  description = "PostgreSQL database password"
  type        = string
  sensitive   = true
}

variable "postgres_external_port" {
  description = "External port for PostgreSQL"
  type        = number
  default     = 5432
}