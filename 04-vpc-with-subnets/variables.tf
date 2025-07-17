variable "region" {
  default = "us-east-1"
}

variable "profile" {
  default = "dev"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "public_subnet_count" {
  default = 2
}

variable "private_subnet_count" {
  default = 2
}