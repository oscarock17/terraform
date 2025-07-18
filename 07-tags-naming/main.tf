provider "aws" {
  region = "us-east-1"
  profile = "dev"
}

resource "aws_s3_bucket" "bucket" {
  bucket = "my-bucket-${random_id.suffix.hex}"

  tags = {
    Environment = "Dev"
    Owner       = "Oscar"
    Name        = "Bucket tagged with Terraform"
  }
}

resource "random_id" "suffix" {
  byte_length = 4
}