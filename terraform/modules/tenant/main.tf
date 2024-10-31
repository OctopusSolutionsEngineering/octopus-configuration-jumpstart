terraform {
  required_providers {
    octopusdeploy = {
      source = "OctopusDeployLabs/octopusdeploy"
    }
  }
}

resource "octopusdeploy_tenant" "tenant" {
  name               = var.name
  description        = var.description
  space_id           = var.space_id
  tenant_tags        = var.tenant_tags
}