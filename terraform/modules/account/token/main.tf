terraform {
  required_providers {
    octopusdeploy = {
      source = "OctopusDeploy/octopusdeploy"
    }
  }
}

resource "octopusdeploy_token_account" "account" {
  name                              = var.name
  token                             = var.token
  space_id                          = var.space_id
  description                       = var.description
  environments                      = var.environments
  tenant_tags                       = var.tenant_tags
  tenanted_deployment_participation = var.tenanted_deployment_participation
  tenants                           = var.tenants
}
