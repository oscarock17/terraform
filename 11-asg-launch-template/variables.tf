variable "region" {
  description = "The AWS region to deploy resources in"
  default     = "us-east-1"
}

variable "profile" {
  description = "The AWS profile to use for authentication"
  default     = "dev"
}

variable "ami_id" {
  description = "The AMI ID to use for the launch template"
  default     = "ami-0e0dab2e7d3136219"
}

variable "instance_type" {
  description = "The instance type for the launch template"
  default     = "t2.micro"
}

variable "desired_capacity" {
  description = "The desired number of instances in the Auto Scaling group"
  default     = 2
}

variable "max_size" {
  description = "The maximum number of instances in the Auto Scaling group"
  default     = 3
}

variable "min_size" {
  description = "The minimum number of instances in the Auto Scaling group"
  default     = 1
}

variable "vpc_zone_identifier" {
  description = "The VPC subnets for the Auto Scaling group"
  type        = list(string)
  default     = ["subnet-0397ab85bb4a5dfed"] # Reemplazar con tus subnets
}



