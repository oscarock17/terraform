variable "region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "us-east-1"
}

variable "profile" {
  description = "AWS CLI profile to use"
  type        = string
  default     = "dev"
}

variable "vpc_id" {
  description = "VPC ID where the ALB and target group will be created"
  type        = string
  default = "vpc-0db5db61975b45a59"
}

variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
  default = "172.31.100.0/16"
}

