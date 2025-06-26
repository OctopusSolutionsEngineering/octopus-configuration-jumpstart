terraform {
  required_providers {
    octopusdeploy = {
      source = "OctopusDeploy/octopusdeploy"
    }
  }
}

resource "octopusdeploy_aws_account" "account" {
  access_key = "access-key"
  name = "AWS Account (OK to Delete)"
  secret_key = "###########" # required; get from secure environment/store
  space_id = var.space_id
  description = var.description
  environments = var.environments
  tenant_tags = var.tenant_tags
  tenanted_deployment_participation = var.tenanted_deployment_participation
  tenants = var.tenants
}