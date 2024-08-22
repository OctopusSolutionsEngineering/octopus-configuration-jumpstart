terraform {
  required_providers {
    octopusdeploy = {
      source = "OctopusDeployLabs/octopusdeploy"
    }
  }
}

resource "octopusdeploy_gcp_account" "account" {
  name                              = var.name
  json_key                          = var.json_key
  space_id                          = var.space_id
  description                       = var.description
  environments                      = var.environments
  tenant_tags                       = var.tenant_tags
  tenanted_deployment_participation = var.tenanted_deployment_participation
  tenants                           = var.tenants
}
