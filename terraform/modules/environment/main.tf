terraform {
  required_providers {
    octopusdeploy = {
      source = "OctopusDeploy/octopusdeploy"
    }
  }
}

resource "octopusdeploy_environment" "environment" {
  allow_dynamic_infrastructure = var.allow_dynamic_infrastructure
  description                  = var.description
  name                         = var.name
  use_guided_failure           = var.use_guided_failure
  sort_order                   = var.sort_order
  space_id                     = var.space_id

  jira_extension_settings {
    environment_type = var.jira_extension_settings_environment_type
  }

  jira_service_management_extension_settings {
    is_enabled = var.jira_service_management_extension_settings_is_enabled
  }

  servicenow_extension_settings {
    is_enabled = var.servicenow_extension_settings_is_enabled
  }
}
