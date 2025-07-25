output "efs_id" {
  description = "The ID of the created EFS."
  value       = aws_efs_file_system.my_efs.id
}