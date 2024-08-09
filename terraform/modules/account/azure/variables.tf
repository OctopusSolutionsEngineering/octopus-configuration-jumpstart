variable "application_id" {
  type = string
}

variable "name" {
  type = string
}

variable "password" {
  type      = string
  sensitive = true
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

variable "authentication_endpoint" {
  type    = string
  default = null
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
