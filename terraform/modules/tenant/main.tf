terraform {
  required_providers {
    octopusdeploy = {
      source = "OctopusDeploy/octopusdeploy"
    }
  }
}

resource "octopusdeploy_tenant" "tenant" {
  name               = var.name
  description        = var.description
  is_disabled        = var.is_disabled
  space_id           = var.space_id
  tenant_tags        = var.tenant_tags
}
