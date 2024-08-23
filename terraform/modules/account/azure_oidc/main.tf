terraform {
  required_providers {
    octopusdeploy = {
      source = "OctopusDeployLabs/octopusdeploy"
    }
  }
}

resource "octopusdeploy_azure_openid_connect" "account" {
  application_id                    = var.application_id
  name                              = var.name
  subscription_id                   = var.subscription_id
  tenant_id                         = var.tenant_id
  space_id                          = var.space_id
  account_test_subject_keys         = var.account_test_subject_keys
  authentication_endpoint           = var.authentication_endpoint
  azure_environment                 = var.azure_environment
  description                       = var.description
  environments                      = var.environments
  execution_subject_keys            = var.execution_subject_keys
  health_subject_keys               = var.health_subject_keys
  resource_manager_endpoint         = var.resource_manager_endpoint
  tenant_tags                       = var.tenant_tags
  tenanted_deployment_participation = var.tenanted_deployment_participation
  tenants                           = var.tenants
}
