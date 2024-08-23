variable "application_id" {
  type = string
}

variable "name" {
  type = string
}

variable "space_id" {
  type = string
}

variable "subscription_id" {
  type = string
}

variable "tenant_id" {
  type = string
}

# optional

variable "account_test_subject_keys" {
  type    = list(string)
  default = [] # Keys to include in an account test. Valid options are: space, account, type
}

variable "audience" {
  type    = string
  default = null # Federated credentials audience, this value is used to establish a connection between external workload identities and Microsoft Entra ID.
}

variable "authentication_endpoint" {
  type    = string
  default = null # The authentication endpoint URI for this resource.
}

variable "azure_environment" {
  type    = string
  default = null # valid values are AzureCloud, AzureChinaCloud, AzureGermanCloud, or AzureUSGovernment
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

variable "resource_manager_endpoint" {
  type    = string
  default = null
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
