variable "region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "us-east-1"
}

variable "profile" {
  description = "AWS profile to use for authentication"
  type        = string
  default     = "dev"
}

variable "ami"{
  description = "AMI ID for the EC2 instance"
  type        = string
  default     = "ami-050fd9796aa387c0d" # Example AMI ID, replace with a valid one
}

variable "instance_type" {
  description = "Type of EC2 instance"
  type        = string
  default     = "t2.micro"
}

variable "vpc_id" {
  description = "VPC ID where resources will be deployed"
  type        = string
  default     = "vpc-0db5db61975b45a59" # Specify your VPC ID here
}

variable "subnet_id" {
  description = "Subnet ID for the EC2 instance"
  type        = string
  default     = "subnet-0397ab85bb4a5dfed" # Specify your Subnet ID here
}