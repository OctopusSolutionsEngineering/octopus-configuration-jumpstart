variable "allow_dynamic_infrastructure" {
  type    = bool
  default = false
}

variable "description" {
  type    = string
  default = ""
}

variable "name" {
  type = string
}

variable "jira_extension_settings_environment_type" {
  type    = string
  default = "unmapped"
}

variable "jira_service_management_extension_settings_is_enabled" {
  type    = bool
  default = false
}

variable "servicenow_extension_settings_is_enabled" {
  type    = bool
  default = false
}

variable "sort_order" {
  type = number
}

variable "space_id" {
  type = string
}

variable "use_guided_failure" {
  type    = bool
  default = false
}
