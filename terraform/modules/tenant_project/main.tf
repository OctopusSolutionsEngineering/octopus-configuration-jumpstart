terraform {
  required_providers {
    octopusdeploy = {
      source = "OctopusDeploy/octopusdeploy"
    }
  }
}

resource "octopusdeploy_tenant_project" "tenant_project" {
  project_id         = var.project_id
  tenant_id          = var.tenant_id
  environment_ids    = var.environment_ids
  space_id           = var.space_id
}
