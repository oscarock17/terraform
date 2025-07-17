provider "aws" {
  region = "us-east-1"
  profile = "dev"
}

resource "aws_s3_bucket" "bucket" {
  bucket = "my-terraform-bucket-${random_id.suffix.hex}"
  force_destroy = true
}

resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "random_id" "suffix" {
  byte_length = 4
}