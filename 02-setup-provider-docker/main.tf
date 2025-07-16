terraform {
  required_providers {
    docker = {
      source  = "calxus/docker"
      version = "~> 3.0"
    }
  }
}

provider "docker" {
  registry_auth {
    address  = "ghcr.io"
    username = "oscarock17"
    password = var.github_token
  }
}

# Red para la aplicación
resource "docker_network" "app_network" {
  name = "app_network"
}

# Volúmenes
resource "docker_volume" "postgres_data" {
  name = "postgres_data"
}

# Imagenes
resource "docker_image" "app" {
  name         = "ghcr.io/oscarock17/app-nodejs:latest"
  keep_locally = true
}

resource "docker_image" "postgres" {
  name         = "postgres:15"
  keep_locally = true
}

resource "docker_image" "nginx" {
  name         = "nginx:latest"
  keep_locally = true
}

resource "docker_image" "redis" {
  name         = "redis:latest"
  keep_locally = true
}

# Contenedores

resource "docker_container" "app" {
  name  = "container_app"
  image = docker_image.app.latest

  restart = "unless-stopped"

  ports {
    internal = 3000
    external = 3000
  }

  networks_advanced {
    name = docker_network.app_network.name
    aliases = ["app", "nodejs"]
  }

  /*healthcheck { # la imagen debe tener curl instalado para que funcione el healthcheck
    test     = ["CMD-SHELL", "curl -f http://localhost/api/health || exit 1"]
    interval = "30s"
    timeout  = "10s"
    retries  = 3
  }*/
}

resource "docker_container" "postgres" {
  name  = "container_postgres"
  image = docker_image.postgres.latest

  restart = "unless-stopped"

  env = [
    "POSTGRES_DB=${var.database_name}",
    "POSTGRES_USER=${var.database_user}",
    "POSTGRES_PASSWORD=${var.database_password}"
  ]

  ports {
    internal = 5432
    external = var.postgres_external_port
  }

  volumes {
    host_path      = abspath("${path.module}/postgres/init.sql") #abspath convierte una ruta relativa a una ruta absoluta válida para Docker
    container_path = "/docker-entrypoint-initdb.d/init.sql"
    read_only      = true
  }

  networks_advanced {
    name = docker_network.app_network.name
    aliases = ["database", "postgres"]
  }
}

resource "docker_container" "nginx" {
  name  = "container_nginx"
  image = docker_image.nginx.latest

  restart = "unless-stopped"

  ports {
    internal = 80
    external = 80
  }

  volumes {
    host_path      = abspath("${path.module}/nginx/default.conf")
    container_path = "/etc/nginx/conf.d/default.conf"
    read_only      = true
  }

  networks_advanced {
    name = docker_network.app_network.name
    aliases = ["nginx"]
  }
}

resource "docker_container" "redis" {
  name  = "container_redis"
  image = docker_image.redis.latest

  restart = "unless-stopped"

  ports {
    internal = 6379
    external = 6379
  }

  networks_advanced {
    name = docker_network.app_network.name
    aliases = ["cache", "redis"]
  }
}


