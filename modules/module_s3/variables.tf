variable "bucket_name" {
  description = "The name of the S3 bucket"
  type        = string
}

variable "region" {
  description = "The AWS region for the S3 bucket"
  type        = string
  default     = "us-east-1"
}