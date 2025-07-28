provider "aws" {
  region  = var.region
  profile = "dev"
}

resource "aws_secretsmanager_secret" "secret_example" {
  name        = "my-secret"
  description = "Un secreto de ejemplo para Terraform"
}

resource "aws_secretsmanager_secret_version" "version_example" {
  secret_id     = aws_secretsmanager_secret.secret_example.id

  secret_string = jsonencode({
    username = var.secret_username
    password = var.secret_password
  })
}

# ejemplo de como usar el secreto en otro recurso
#data "aws_secretsmanager_secret_version" "example" {
  #secret_id = aws_secretsmanager_secret.example.id
#}
