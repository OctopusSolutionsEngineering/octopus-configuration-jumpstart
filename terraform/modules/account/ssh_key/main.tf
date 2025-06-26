terraform {
  required_providers {
    octopusdeploy = {
      source = "OctopusDeploy/octopusdeploy"
    }
  }
}

resource "octopusdeploy_ssh_key_account" "account" {
  name                              = var.name
  private_key_file                  = var.private_key_file
  username                          = var.username
  space_id                          = var.space_id
  description                       = var.description
  environments                      = var.environments
  private_key_passphrase            = var.private_key_passphrase
  tenant_tags                       = var.tenant_tags
  tenanted_deployment_participation = var.tenanted_deployment_participation
  tenants                           = var.tenants
}
