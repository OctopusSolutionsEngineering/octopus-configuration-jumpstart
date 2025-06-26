terraform {
  required_providers {
    octopusdeploy = {
      source = "OctopusDeploy/octopusdeploy"
    }
  }
}

resource "octopusdeploy_aws_elastic_container_registry" "feed" {
  name       = var.name
  access_key = var.access_key
  region     = var.region
  secret_key = var.secret_key
  space_id   = var.space_id
}
