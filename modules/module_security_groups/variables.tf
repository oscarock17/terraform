variable "security_group_name" {
  description = "Nombre del security group"
}

variable "security_group_description" {
  description = "Descripción del security group"
}

variable "vpc_id" {
  description = "ID de la VPC"
}

variable "ingress_rules" {
  description = "Reglas de ingreso"
  type        = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
}

variable "egress_rules" {
  description = "Reglas de salida"
  type        = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
}
