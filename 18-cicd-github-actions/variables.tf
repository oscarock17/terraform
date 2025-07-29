variable "region" {
  default = "us-east-1"
}

variable "profile" {
  default = "dev"
  description = "AWS profile to use for authentication"
}

variable "ami_id" {
  description = "Amazon Linux 2 AMI"
  default     = "ami-01edd5711cfe3825c" # Amazon Linux 2 Free Tier
}

variable "instance_type" {
  default = "t2.micro"
}

variable "subnet_id" {
  description = "ID of the subnet where the instance will be launched"
  default     = "subnet-0397ab85bb4a5dfed"
}