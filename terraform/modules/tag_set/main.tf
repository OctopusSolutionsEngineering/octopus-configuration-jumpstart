terraform {
  required_providers {
    octopusdeploy = {
      source = "OctopusDeployLabs/octopusdeploy"
    }
  }
}

resource "octopusdeploy_tag_set" "tag_set" {
  name        = var.name
  description = var.description
  sort_order  = var.sort_order
  space_id    = var.space_id
}
