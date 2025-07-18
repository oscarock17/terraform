variable "region" {
  default = "us-east-1"
}

variable "ami_id" {
  description = "Amazon Linux 2 AMI"
  default     = "ami-050fd9796aa387c0d" # Amazon Linux 2 Free Tier
}

variable "instance_type" {
  default = "t2.micro"
}