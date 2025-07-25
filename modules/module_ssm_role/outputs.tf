output "role_arn" {
  value = aws_iam_role.rol_ssm.arn
}

output "instance_profile_arn" {
  value = aws_iam_instance_profile.instance-profile.arn
}

output "instance_profile_name" {
  value = aws_iam_role.rol_ssm.name
}
