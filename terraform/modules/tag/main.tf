terraform {
  required_providers {
    octopusdeploy = {
      source = "OctopusDeployLabs/octopusdeploy"
    }
  }
}

resource "octopusdeploy_tag" "tag" {
  name             = var.name
  color            = var.color
  description      = var.description
  sort_order       = var.sort_order
  tag_set_id       = var.tag_set_id
  tag_set_space_id = var.tag_set_space_id
}
