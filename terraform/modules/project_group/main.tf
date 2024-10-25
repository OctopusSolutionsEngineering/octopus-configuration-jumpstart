terraform {
  required_providers {
    octopusdeploy = {
      source = "OctopusDeployLabs/octopusdeploy"
    }
  }
}

resource "octopusdeploy_project_group" "project" {
  name         = var.name
  description  = var.description
  space_id     = var.space_id
}