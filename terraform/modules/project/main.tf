terraform {
  required_providers {
    octopusdeploy = {
      source = "OctopusDeploy/octopusdeploy"
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

  dynamic "git_anonymous_persistence_settings" {
    for_each = var.git_anonymous_persistence_settings[*]

    content {
      url = git_anonymous_persistence_settings.value.url
      base_path = git_anonymous_persistence_settings.value.base_path
      default_branch = git_anonymous_persistence_settings.value.default_branch
      protected_branches = git_anonymous_persistence_settings.value.protected_branches
    }
  }

  dynamic "git_library_persistence_settings" {
    for_each = var.git_library_persistence_settings[*]

    content {
      git_credential_id = git_library_persistence_settings.value.git_credential_id
      url = git_library_persistence_settings.value.url
      base_path = git_library_persistence_settings.value.base_path
      default_branch = git_library_persistence_settings.value.default_branch
      protected_branches = git_library_persistence_settings.value.protected_branches
    }
  }

  dynamic "git_username_password_persistence_settings" {
    for_each = var.git_username_password_persistence_settings[*]

    content {
      password = git_username_password_persistence_settings.value.password
      url = nonsensitive(git_username_password_persistence_settings.value.url)
      username = nonsensitive(git_username_password_persistence_settings.value.username)
      base_path = nonsensitive(git_username_password_persistence_settings.value.base_path)
      default_branch = nonsensitive(git_username_password_persistence_settings.value.default_branch)
      protected_branches = nonsensitive(git_username_password_persistence_settings.value.protected_branches)
    }
  }

  included_library_variable_sets = var.included_library_variable_sets
  is_disabled = var.is_disabled
  is_discrete_channel_release = var.is_discreet_channel_release

  # is version controlled

  dynamic "jira_service_management_extension_settings" {
    for_each = var.jira_service_management_extension_settings[*]

    content {
      is_enabled = jira_service_management_extension_settings.value.is_enabled
      connection_id = jira_service_management_extension_settings.value.connection_id
      service_desk_project_name = jira_service_management_extension_settings.value.service_desk_project_name
    }
  }

  dynamic "servicenow_extension_settings" {
    for_each = var.servicenow_extension_settings[*]

    content {
      is_enabled = servicenow_extension_settings.value.is_enabled
      connection_id = servicenow_extension_settings.value.connection_id
      is_state_automatically_transitioned = servicenow_extension_settings.value.is_state_automatically_transitioned
      standard_change_template_name = servicenow_extension_settings.value.standard_change_template_name
    }
  }

  release_notes_template = var.release_notes_template
  slug = var.slug
  tenanted_deployment_participation = var.tenanted_deployment_participation

  dynamic "template" {
    for_each = var.templates

    content {
      name = template.value.name
      default_value = template.value.default_value
      display_settings = template.value.display_settings
      help_text = template.value.help_text
      id = template.value.id
      label = template.value.label
    }
  }
}
