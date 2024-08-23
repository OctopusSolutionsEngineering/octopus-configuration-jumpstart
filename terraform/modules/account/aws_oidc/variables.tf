variable "name" {
  type = string
}

variable "space_id" {
  type = string
}

variable "role_arn" {
  type = string # The Amazon Resource Name (ARN) of the role that the caller is assuming.
}

# optional

variable "account_test_subject_keys" {
  type    = list(string)
  default = [] # Keys to include in an account test. Valid options are: space, account, type
}

variable "description" {
  type    = string
  default = ""
}

variable "environments" {
  type    = list(string)
  default = []
}

variable "execution_subject_keys" {
  type    = list(string)
  default = [] # Keys to include in a deployment or runbook. Valid options are space, environment, project, tenant, runbook, account, type
}

variable "health_subject_keys" {
  type    = list(string)
  default = [] # Keys to include in a health check. Valid options are space, account, target, type
}

variable "session_duration" {
  type    = number
  default = null # The duration, in seconds, of the role session.
}

variable "tenant_tags" {
  type    = list(string)
  default = []
}

variable "tenanted_deployment_participation" {
  type    = string
  default = "Untenanted"
}

variable "tenants" {
  type    = list(string)
  default = []
}
