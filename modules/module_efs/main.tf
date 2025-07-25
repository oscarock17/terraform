resource "aws_efs_file_system" "my_efs" {
  creation_token   = var.creation_token
  performance_mode = var.performance_mode
  encrypted        = var.encrypted

  tags = var.tags
}

resource "aws_efs_mount_target" "efs_mount_target" {
  for_each        = { for idx, subnet_id in var.subnet_ids : idx => subnet_id }
  file_system_id  = aws_efs_file_system.my_efs.id
  subnet_id       = each.value
  security_groups = [var.security_group_id]
}