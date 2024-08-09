terraform {
  required_providers {
    octopusdeploy = {
      source = "OctopusDeployLabs/octopusdeploy"
    }
  }
}

resource "octopusdeploy_username_password_account" "account" {
  name                              = var.name
  password                          = var.password
  username                          = var.username
  space_id                          = var.space_id
  description                       = var.description
  environments                      = var.environments
  tenant_tags                       = var.tenant_tags
  tenanted_deployment_participation = var.tenanted_deployment_participation
  tenants                           = var.tenants
}
