terraform {
  required_providers {
    octopusdeploy = {
      source = "OctopusDeploy/octopusdeploy"
    }
  }
}

resource "octopusdeploy_aws_openid_connect_account" "account" {
  name                              = var.name
  role_arn                          = var.role_arn
  space_id                          = var.space_id
  account_test_subject_keys         = var.account_test_subject_keys
  description                       = var.description
  environments                      = var.environments
  execution_subject_keys            = var.execution_subject_keys
  health_subject_keys               = var.health_subject_keys
  session_duration                  = var.session_duration
  tenant_tags                       = var.tenant_tags
  tenanted_deployment_participation = var.tenanted_deployment_participation
  tenants                           = var.tenants
}
