variable "auto_create_release" {
  type = bool
  default = false
}

variable "cac_git_base_path" {
  type = string
  default = null
}

variable "cac_git_credential_id" {
  type = string
  default = null
}

variable "cac_git_default_branch" {
  type = string
  default = null
}

variable "cac_git_password" {
  type = string
  default = null
  sensitive = true
}

variable "cac_git_protected_branches" {
  type = set(string)
  default = null
}

variable "cac_git_url" {
  type = string
  default = null
}

variable "cac_git_username" {
  type = string
  default = null
}

variable "connectivity_policy" {
  type = object({
    allow_deployments_to_no_targets = optional(bool)
    exclude_unhealthy_targets = optional(bool)
    skip_machine_behavior = optional(string)
    target_roles = optional(list(string))
  })
  default = null
}

variable "default_guided_failure_mode" {
  type = string
  default = "EnvironmentDefault"
}

variable "default_to_skip_if_already_installed" {
  type = bool
  default = false
}

variable "deployment_changes_template" {
  type = string
  default = ""
}

variable "description" {
  type = string
  default = ""
}

variable "included_library_variable_sets" {
  type = list(string)
  default = null
}

variable "is_cac_using_git_anonymous" {
  type = bool
  default = false
}

variable "is_cac_using_git_library_credential" {
  type = bool
  default = false
}

variable "is_cac_using_git_username_password" {
  type = bool
  default = false
}

variable "is_disabled" {
  type = bool
  default = false
}

variable "is_discreet_channel_release" {
  type = bool
  default = false
}

variable "is_version_controlled" {
  type = bool
  default = false
}

variable "git_anonymous_persistence_settings" {
  type = object({
    url = string
    base_path = optional(string)
    default_branch = optional(string)
    protected_branches = optional(set(string))
  })
  default = null
}

variable "git_library_persistence_settings" {
  type = object({
    git_credential_id = string
    url = string
    base_path = optional(string)
    default_branch = optional(string)
    protected_branches = optional(set(string))
  })
  default = null
}

variable "git_username_password_persistence_settings" {
  type = object({
    password = string
    url = string
    username = string
    base_path = optional(string)
    default_branch = optional(string)
    protected_branches = optional(set(string))
  })
  default = null
  sensitive = true
}

variable "jira_service_management_extension_settings" {
  type = object({
    connection_id = string
    is_enabled = bool
    service_desk_project_name = string
  })
  default = null
}

variable "lifecycle_id" {
  type = string
}

variable "name" {
  type = string
}

variable "project_group_id" {
  type = string
}

variable "release_notes_template" {
  type = string
  default = null
}

variable "servicenow_extension_settings" {
  type = object({
    connection_id = string
    is_enabled = bool
    is_state_automatically_transitioned = bool
    standard_change_template_name = optional(string)
  })
  default = null
}

variable "slug" {
  type = string
  default = null
}

variable "space_id" {
  type = string
}

variable "templates" {
  type = list(object({
    name = string
    default_value = optional(string)
    display_settings = optional(map(string))
    help_text = optional(string)
    id = optional(string)
    label = optional(string)
  }))
  default = []
}

variable "tenanted_deployment_participation" {
  type = string
  default = "Untenanted"
}
