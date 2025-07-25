output "db_subnet_group_name" {
  description = "Nombre del grupo de la subnet"
  value       = aws_db_subnet_group.rds_subnet_group.name
}

output "rds_endpoint" {
  description = "Endpoint de la instancia de RDS MySQL"
  value       = aws_db_instance.rds_mysql.endpoint
}