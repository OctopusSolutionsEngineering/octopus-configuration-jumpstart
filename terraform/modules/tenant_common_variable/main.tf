terraform {
  required_providers {
    octopusdeploy = {
      source = "OctopusDeployLabs/octopusdeploy"
    }
  }
}

resource "octopusdeploy_tenant_common_variable" "tenant_common_variable" {
  library_variable_set_id = var.library_variable_set_id
  template_id             = var.template_id
  tenant_id               = var.tenant_id
  space_id                = var.space_id
  value                   = var.value
}
