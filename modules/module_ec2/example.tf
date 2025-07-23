# esto es un ejemplo de uso del modulo EC2
# Este archivo `example.tf` muestra cómo utilizar el módulo EC2 creado en `module_ec2`.
module "ec2" {
  source = "../module_ec2" # Ruta al módulo EC2

  instance_count         = 2
  ami_id                 = "ami-07761f3ae34c4478d"
  instance_type          = "t2.micro"
  subnet_ids             = module.my_vpc.private_subnet_ids
  iam_instance_profile   = module.ssm_role.instance_profile_name
  security_group_ids     = [module.security_group.security_group_id]
  instance_name          = "instances-private"
  user_data              = file("${path.root}/userdata.sh")

  tags_environment       = "dev"
}