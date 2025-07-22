provider "aws" {
  region  = "us-east-1"
  profile = "dev"
}

resource "random_id" "suffix" {
  byte_length = 4
}

resource "aws_s3_bucket" "bucket" {
  bucket = "my-secure-bucket-${random_id.suffix.hex}"
  force_destroy = true
}

# Desbloquear políticas públicas
resource "aws_s3_bucket_public_access_block" "example" {
  bucket                  = aws_s3_bucket.bucket.id
  block_public_acls       = true
  ignore_public_acls      = true
  block_public_policy     = false
  restrict_public_buckets = false
}

# Política: permitir a un IAM user acceder al bucket
data "aws_iam_policy_document" "bucket_policy" {
  statement {
    sid = "AllowReadToSpecificUser"

    principals {
      type        = "AWS"
      identifiers = ["arn:aws:iam::123456789012:user/my-user"] # Cambia esto por tu ARN real
    }

    actions = [
      "s3:GetObject",
      "s3:ListBucket"
    ]

    resources = [
      aws_s3_bucket.bucket.arn,
      "${aws_s3_bucket.bucket.arn}/*"
    ]
  }
}

resource "aws_s3_bucket_policy" "bucket_policy" {
  bucket = aws_s3_bucket.bucket.id
  policy = data.aws_iam_policy_document.bucket_policy.json
}
