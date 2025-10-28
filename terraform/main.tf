# This blueprint does two things:
# 1. It pulls the container image from your GitHub Registry.
resource "docker_image" "app_image" {
  name         = "ghcr.io/vijayeren30/devops_project:latest" # <-- CHANGE THIS USERNAME
  keep_locally = true
}

# 2. It defines a "service" in Docker Swarm, which runs the image.
resource "docker_service" "app_service" {
  name = "my-web-app"
  task_spec {
    container_spec {
      image = docker_image.app_image.name
    }
  }
  endpoint_spec {
    ports {
      target_port    = 80   # The port *inside* the container
      published_port = 8080 # The port you will access on your PC
    }
  }
}