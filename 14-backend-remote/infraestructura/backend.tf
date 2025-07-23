#uso de un backend remoto para almacenar el estado de terraform
terraform {
  backend "s3" {
    bucket         = "mi-backend-terraform-estado"
    key            = "ambiente/dev/terraform.tfstate"
    region         = "us-east-1"
    #dynamodb_table = "terraform-state-lock" -> deprecated, use the new lock configuration
    use_lockfile = true
    encrypt        = true
  }
}