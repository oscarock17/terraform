# esto es un ejemplo de uso del módulo EFS
module "efs_file_system" {
  source = "../module_efs"
  creation_token   = "my-efs"
  performance_mode = "generalPurpose"
  encrypted        = true

  tags = {
    Name = "my-efs-terraform"
  }

  subnet_ids        = module.my_vpc.private_subnet_ids
  security_group_id = module.security_group_efs.security_group_id
}