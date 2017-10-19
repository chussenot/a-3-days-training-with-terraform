# Configure the Docker provider
provider "docker" {
  host = "tcp://127.0.0.1:1234/"
}

# Create a container
resource "docker_container" "foo" {
  image = "${docker_image.nginx.latest}"
  name  = "foo"

  ports {
    internal = 80
    external = 80
  }
}

resource "docker_image" "nginx" {
  name = "nginx:latest"
}
