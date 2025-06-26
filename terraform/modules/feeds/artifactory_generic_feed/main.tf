terraform {
  required_providers {
    octopusdeploy = {
      source = "OctopusDeploy/octopusdeploy"
    }
  }
}

resource "octopusdeploy_artifactory_generic_feed" "feed" {
  name         = var.name
  feed_uri     = var.feed_uri
  repository   = var.repository
  space_id     = var.space_id
  layout_regex = var.layout_regex
  username     = var.username
  password     = var.password
}
