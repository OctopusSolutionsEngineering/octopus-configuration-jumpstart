terraform {
  required_providers {
    octopusdeploy = {
      source = "OctopusDeployLabs/octopusdeploy"
    }
  }
}

resource "octopusdeploy_project" "project" {
  name         = var.name
  lifecycle_id = var.lifecycle_id
  project_group_id = var.project_group_id
  space_id     = var.space_id

  auto_create_release = var.auto_create_release

  dynamic "connectivity_policy" {
    for_each = var.connectivity_policy[*]

    content {
      allow_deployments_to_no_targets = connectivity_policy.value.allow_deployments_to_no_targets
      exclude_unhealthy_targets = connectivity_policy.value.exclude_unhealthy_targets
      skip_machine_behavior = connectivity_policy.value.skip_machine_behavior
      target_roles = connectivity_policy.value.target_roles
    }
  }

  default_guided_failure_mode = var.default_guided_failure_mode
  default_to_skip_if_already_installed = var.default_to_skip_if_already_installed
  deployment_changes_template = var.deployment_changes_template
  description = var.description

  # git anonymous persistent settings
  # git library credential persistent settings
  # git username password persistent settings

  included_library_variable_sets = var.included_library_variable_sets
  is_disabled = var.is_disabled
  is_discrete_channel_release = var.is_discreet_channel_release

  # is version controlled

  jira_service_management_extension_settings {
    is_enabled = var.jira_service_management_extension_settings_is_enabled
    connection_id = var.jira_service_management_extension_settings_connection_id
    service_desk_project_name = var.jira_service_management_extension_settings_service_desk_project_name
  }

  release_notes_template = var.release_notes_template
  slug = var.slug
  tenanted_deployment_participation = var.tenanted_deployment_participation

}
