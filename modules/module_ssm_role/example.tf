# esto es un ejemplo de uso del modulo ssm_role
# Este modulo crea un rol de IAM para SSM y un perfil de instancia asociado
module "ssm_role" {
  source = "../my_modules/module_ssm_role"

  role_name             = "TerraformSSM"
  role_description      = "Rol creado por Terraform para el acceso al Session Manager"
  policy_arn            = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
  instance_profile_name = "TerraformSSM"
}