variable "target_group_name" {
  description = "Nombre del grupo de destino"
}

variable "target_group_port" {
  description = "Puerto en el que escuchan las instancias de destino"
}

variable "vpc_id" {
  description = "ID de la VPC donde residen las instancias de destino"
}

variable "health_check_path" {
  description = "Ruta de verificación de salud para el grupo de destino"
  type        = string
  default     = "/health"
}

variable "health_check_interval" {
  description = "Intervalo de verificación de salud en segundos"
  type        = number
  default     = 30
}

variable "health_check_timeout" {
  description = "Tiempo de espera de verificación de salud en segundos"
  type        = number
  default     = 5
}

variable "health_check_healthy_threshold" {
  description = "Umbral de salud exitoso para la verificación de salud"
  type        = number
  default     = 2
}

variable "health_check_unhealthy_threshold" {
  description = "Umbral de no saludable para la verificación de salud"
  type        = number
  default     = 2
}

variable "health_check_matcher" {
  description = "Especificar cuánto tiempo quieres que las instancias permanezcan en estado pending"
  type        = number
  default     = 200
}

variable "instance_ids" {
  description = "IDs de las instancias a adjuntar al grupo de destino"
  type        = list(string)
}

variable "load_balancer_name" {
  description = "Nombre del balanceador de carga"
}

variable "internal" {
  description = "Indica si el balanceador de carga es interno o no"
  type        = bool
}

variable "load_balancer_type" {
  description = "Tipo de balanceador de carga"
}

variable "subnets" {
  description = "IDs de las subnets donde se creará el balanceador de carga"
  type        = list(string)
}

variable "security_group_id" {
  description = "ID del grupo de seguridad asignado al balanceador de carga"
}

variable "listener_port" {
  description = "Puerto de escucha del balanceador de carga"
}