data "octopusdeploy_space" "default" {
  name = "Default"
}

module "default_dev_test_prod" {
  source = "../modules/preset_envs/dev_test_prod"

  providers = {
    octopusdeploy = octopusdeploy
  }

  space_id = data.octopusdeploy_space.default.id
}

module "default_account" {
  source = "../modules/account/username_password"

  name     = "Test Account"
  username = var.account_username
  password = var.account_password
  space_id = data.octopusdeploy_space.default.id
}

/*
module "default_azure_account" {
    source = "./modules/account/azure"

    name = "Azure Test Account"
    application_id = var.azure_account_application_id
    password = var.azure_account_password
    subscription_id = var.azure_account_subscription_id
    tenant_id = var.azure_account_tenant_id
    space_id = data.octopusdeploy_space.default.id
}
*/

module "default_docker_registry" {
  source = "../modules/feeds/docker_container_registry"

  name     = "Docker Hub"
  space_id = data.octopusdeploy_space.default.id
}

module "default_helm_feed" {
  source = "../modules/feeds/helm_feed"

  name     = "Helm - Stable"
  space_id = data.octopusdeploy_space.default.id
}

module "internal_tenant" {
  source = "../modules/tenant"

  name     = "_Internal"
  description = "Tenant for internal testing"
  space_id = data.octopusdeploy_space.default.id
}

module "customer_a_tenant" {
  source = "../modules/tenant"

  name     = "Customer A"
  description = "Tenant for Customer A"
  space_id = data.octopusdeploy_space.default.id
}

module "test_project_group" {
  source = "../modules/project_group"

  name = "Test Project Group"
  description = "Testing project group creation via Terraform"
  space_id = data.octopusdeploy_space.default.id
}

module "test_project" {
  source = "../modules/project"

  name = "Test Project"
  description = "Testing project creation via Terraform"
  lifecycle_id = module.default_dev_test_prod.standard_lifecycle_id
  project_group_id = module.test_project_group.id
  space_id = data.octopusdeploy_space.default.id
  tenanted_deployment_participation = "Tenanted"
}

module "internal_test_project" {
  source = "../modules/tenant_project"

  tenant_id = module.internal_tenant.id
  project_id = module.test_project.id
  environment_ids = [module.default_dev_test_prod.dev_env_id]
  space_id = data.octopusdeploy_space.default.id
}