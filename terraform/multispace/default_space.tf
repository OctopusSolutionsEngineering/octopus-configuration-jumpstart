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
