# 📄 Ejercicios practicos Terraform

Este repositorio contiene una colección de ejercicios en Terraform pensados para practicar y demostrar habilidades en Infraestructura como Código (IaC).

## 📂 Ejercicios disponibles

| Nº | Archivo | Descripción |
|----|---------|-------------|
| 01 | [01-basic-setup](./01-basic-setup/) | Primeros pasos inicializar el provider
| 02 | [02-setup-provider-docker](./02-setup-provider-docker/) | Levanta app nodejs con provider docker
| 03 | [03-s3-bucket-versioning](./03-s3-bucket-versioning/) | Crea bucket S3 en AWS con versionado
| 04 | [04-vpc-with-subnets](./04-vpc-with-subnets/) | Crea VPC en AWS con 2 subnest publicas, 2 privadas, NAT, IGW y route tables
| 05 | [05-aws-ec2-instance](./05-aws-ec2-instance/) | Crea Instancia EC2 en AWS
| 06 | [06-variables-outputs](./06-variables-outputs/) | Variables y Outputs con AWS
| 07 | [07-tags-namings](./07-tags-naming/) | Tags de recursos en AWS
| 08 | [08-security-group](./08-security-group/) | Crea security group en AWS port (22, 80)
| 09 | [09-ec2-eip-sg](./09-ec2-eip-sg/) | Crea EC2 con un security group en AWS port (22, 80)
| 10 | [10-alb-basic](./10-alb-basic/) | Crea un ALB con una VPC y otros componentes en AWS
| 11 | [11-asg-launch-template](./11-asg-launch-template/) | Crea ASG launch template en AWS
| 12 | [12-modules-reuse](./12-modules-reuse/) | Reutilizacion de modulos creados en AWS
| 13 | [13-s3-with-policy](./13-s3-with-policy/) | Crea bucket S3 con politica en AWS
| 14 | [14-backend-remote](./14-backend-remote/) | Crea backend remoto para guardar el estado usando s3 y dymamoDB en AWS

## 🧩  Modulos disponibles

| Nº | Archivo | Descripción |
|----|---------|-------------|
| 01 | [module_vpc](./modules/module_vpc/) | Modulo para crear una VPC completa con subnets, IGW, NAT, RT en AWS
| 02 | [module_security_groups](./modules/module_security_groups/) | Modulo para crear security groups en AWS


## 📦 Requisitos

- [Terraform](https://www.terraform.io/)
- Cuenta de AWS
- Configurar `aws configure` o usar variables de entorno

## 🛠️ Comandos útiles de Terraform

| Comando | Descripción |
|--------|-------------|
| `terraform init` | Inicializa el proyecto y descarga los proveedores |
| `terraform plan` | Muestra el plan de ejecución antes de aplicar cambios |
| `terraform apply` | Aplica los cambios definidos en el código |
| `terraform destroy` | Elimina toda la infraestructura creada |
| `terraform fmt` | Formatea el código Terraform de acuerdo a las convenciones |
| `terraform validate` | Valida la sintaxis del código Terraform |
| `terraform output` | Muestra los valores de salida definidos |
| `terraform state list` | Lista los recursos registrados en el estado actual |
| `terraform taint <recurso>` | Marca un recurso para ser recreado en la próxima ejecución |
| `terraform import <recurso> <id>` | Importa recursos existentes al estado de Terraform |

## 🙌 Autor

- Este proyecto fue creado por **Oscar Diaz**.

## Contacto

Para cualquier pregunta o comentario, no dudes en ponerte en contacto conmigo en [GitHub](https://github.com/oscarock17)