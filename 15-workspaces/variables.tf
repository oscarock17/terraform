variable "region" {
  default = "us-east-1"
}

variable "profile" {
  default = "dev"
}

variable "ami_id" {
  description = "Amazon Linux 2 AMI"
  default     = "ami-0e0dab2e7d3136219" # Amazon Linux 2 Free Tier
}

variable "instance_type" {
  type        = string
  description = "Tipo de instancia EC2"
  default     = "t2.micro"
}

variable "subnet_id" {
  description = "ID de la subnet donde se lanzará la instancia"
  type        = string
  default     = "subnet-0397ab85bb4a5dfed" # Colocar el ID de una subnet válida
}