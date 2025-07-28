output "secret_arn" {
  description = "ARN del secreto"
  value       = aws_secretsmanager_secret.secret_example.arn
}

output "secret_string" {
  value     = jsondecode(aws_secretsmanager_secret_version.version_example.secret_string)
  sensitive = true
}