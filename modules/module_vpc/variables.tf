variable "vpc_cidr_block" {
  description = "CIDR block for VPC"
  type        = string
}

variable "vpc_name" {
  description = "Name for VPC"
  type        = string
}

variable "dns_hostnames" {
  description = "Habilitar la resolucion de DNS"
  type        = bool
  default     = false
}

variable "public_subnet_count" {
  description = "Number of public subnets"
  type        = number
}

variable "public_subnet_name" {
  description = "Name for public subnets"
  type        = string
}

variable "private_subnet_count" {
  description = "Number of private subnets"
  type        = number
}

variable "private_subnet_name" {
  description = "Name for private subnets"
  type        = string
}

variable "availability_zones" {
  type    = list(string)
  default = ["us-east-1a", "us-east-1b"]  # Cambia estas AZs según tu región
}