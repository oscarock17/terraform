provider "aws" {
  region = "us-east-1"
  profile = "dev"
}

# comando para importar recurso
# terraform import aws_s3_bucket.mi_bucket mi-bucket-existente007
resource "aws_s3_bucket" "mi_bucket" {
  bucket = "mi-bucket-existente007"
}