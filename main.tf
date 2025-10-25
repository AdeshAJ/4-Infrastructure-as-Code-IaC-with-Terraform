terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
  }
}

provider "docker" {}

# Pull the latest Nginx image
resource "docker_image" "nginx" {
  name = "nginx:latest"
}

# Create a container from the pulled image
resource "docker_container" "nginx" {
  name  = "terraform-nginx"
  image = docker_image.nginx.name

  ports {
    internal = 80
    external = 8080
  }
}
