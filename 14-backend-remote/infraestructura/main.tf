#prueba de terraform con backend remoto en s3
provider "aws" {
  region  = "us-east-1"
  profile = "dev"
}

resource "aws_s3_bucket" "demo" {
  bucket = "demo-bucket-prueba-terraform"
  force_destroy = true
}
