terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "4.7.0"
    }
  }
}

# Pulls the image
resource "docker_image" "nginx" {
  name = var.image
}

# Create a container
resource "docker_container" "nginx" {
  count = var.nbr_container
  image = docker_image.nginx.image_id
  name  = "nginx-${count.index}"
  memory = var.memory
  ports {
    internal = 80
    external = var.starting_port + count.index
  }
  command = [
        "/bin/sh",
        "-c",
        "echo $HOSTNAME > /usr/share/nginx/html/index.html && exec nginx -g 'daemon off;'"
  ]
  privileged = var.isPriviledged
}