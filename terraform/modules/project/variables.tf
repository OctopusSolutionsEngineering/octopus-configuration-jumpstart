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

variable "jira_service_management_extension_settings_connection_id" {
  type = string
  default = null
}

variable "jira_service_management_extension_settings_is_enabled" {
  type = bool
  default = false
}

variable "jira_service_management_extension_settings_service_desk_project_name" {
  type = string
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

variable "slug" {
  type = string
  default = null
}

variable "space_id" {
  type = string
}

variable "tenanted_deployment_participation" {
  type = string
  default = "Untenanted"
}
