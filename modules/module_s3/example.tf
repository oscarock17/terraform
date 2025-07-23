# esto es un ejemplo de uso del modulo S3
# Este archivo `example.tf` muestra cómo utilizar el módulo S3 creado en `module_s3`.
module "s3_bucket" {
  source      = "../module_s3" # Ruta al módulo S3
  bucket_name = "test-ansible-oscar-diaz" # Nombre del bucket S3
}