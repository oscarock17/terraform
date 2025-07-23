# esto es un ejemplo de uso de un modulo de security groups
# Este archivo `example.tf` muestra cómo utilizar el módulo securiry groups creado en `module_securiry_groups`.
module "security_group" {
  source                      = "../module_security_groups"
  security_group_name         = "private-instances-sg"
  security_group_description  = "Crea el security group para las instancias privadas"
  vpc_id                      = module.my_vpc.vpc_id

  ingress_rules = [
    {
      from_port   = 443
      to_port     = 443
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    },
    {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]

  egress_rules = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = "all"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]
}

#otro ejemplo de uso del modulo de security groups con un EFS
module "security_group_efs" {
  source                      = "../module_security_groups"
  security_group_name         = "storage-efs-sg"
  security_group_description  = "Crea el security group para la conexion al EFS"
  vpc_id                      = module.my_vpc.vpc_id

  ingress_rules = [
    {
      from_port   = 2049
      to_port     = 2049
      protocol    = "tcp"
      cidr_blocks = [ for ip in module.ec2.private_ips : format("%s/32", ip) ]
    },
  ]

  egress_rules = []
}

#otro ejemplo de uso del modulo con un RDS
module "security_group_rds" {
  source                      = "../my_modules/module_security_groups"
  security_group_name         = "rds-sg"
  security_group_description  = "Crea el security group para la base de datos"
  vpc_id                      = module.my_vpc.vpc_id

  ingress_rules = [
    {
      from_port   = 3306
      to_port     = 3306
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    },
  ]

  egress_rules = []
}

# otro ejemplo de uso del modulo con un Load Balancer
module "security_group_elb" {
  source                      = "../module_security_groups"
  security_group_name         = "load-balancer-sg"
  security_group_description  = "Crea el security group para el load balancer"
  vpc_id                      = module.my_vpc.vpc_id

  ingress_rules = [
    {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    },
  ]

  egress_rules = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = "all"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]
}