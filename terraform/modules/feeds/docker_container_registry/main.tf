terraform {
  required_providers {
    octopusdeploy = {
      source = "OctopusDeployLabs/octopusdeploy"
    }
  }
}

resource "octopusdeploy_docker_container_registry" "feed" {
  feed_uri = var.feed_uri # "https://index.docker.io"
  name = var.name # "Test Docker Container Registry (OK to Delete)"
  password = var.password
  registry_path = var.registry_path # "testing/test-image"
  username = var.username
  space_id = var.space_id
}
