terraform {
  required_providers {
    octopusdeploy = {
      source = "OctopusDeployLabs/octopusdeploy"
    }
  }
}

resource "octopusdeploy_nuget_feed" "feed" {
  feed_uri                       = var.feed_uri
  name                           = var.name
  download_attempts              = var.download_attempts
  download_retry_backoff_seconds = var.download_retry_backoff_seconds
  is_enhanced_mode               = var.is_enahanced_mode
  password                       = var.password
  username                       = var.username
  space_id                       = var.space_id
}
