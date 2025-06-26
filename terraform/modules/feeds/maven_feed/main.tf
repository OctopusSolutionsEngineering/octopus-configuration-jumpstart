terraform {
  required_providers {
    octopusdeploy = {
      source = "OctopusDeploy/octopusdeploy"
    }
  }
}

resource "octopusdeploy_maven_feed" "feed" {
  feed_uri                       = var.feed_uri
  name                           = var.name
  download_attempts              = var.download_attempts
  download_retry_backoff_seconds = var.download_retry_backoff_seconds
  password                       = var.password
  username                       = var.username
  space_id                       = var.space_id
}
