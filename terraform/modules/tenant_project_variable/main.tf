terraform {
  required_providers {
    octopusdeploy = {
      source = "OctopusDeployLabs/octopusdeploy"
    }
  }
}

resource "octopusdeploy_tenant_project_variable" "tenant_project_variable" {
  environment_id = var.environment_id
  project_id     = var.project_id
  template_id    = var.template_id
  tenant_id      = var.tenant_id
  space_id       = var.space_id
  value          = var.value
}
