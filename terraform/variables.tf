variable "account_password" {
  type      = string
  sensitive = true
}

variable "account_username" {
  type = string
}

variable "azure_account_application_id" {
  type      = string
  sensitive = true
}

variable "azure_account_password" {
  type      = string
  sensitive = true
}

variable "azure_account_subscription_id" {
  type      = string
  sensitive = true
}

variable "azure_account_tenant_id" {
  type      = string
  sensitive = true
}

variable "octopus_service_account" {
  type    = string
  default = "Octopus Configuration Service Account"
}
