terraform {
  required_providers {
    octopusdeploy = {
      source = "OctopusDeployLabs/octopusdeploy"
    }
  }
}

resource "octopusdeploy_helm_feed" "feed" {
  feed_uri = var.feed_uri
  name     = var.name
  password = var.password
  username = var.username
  space_id = var.space_id
}
