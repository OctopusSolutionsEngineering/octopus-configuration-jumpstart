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

module "release_ring_tag_set" {
  source = "../modules/tag_set"

  name = "Release Ring"
  description = "Tag set for release rings"
  space_id = data.octopusdeploy_space.default.id
}

module "release_ring_alpha" {
  source = "../modules/tag"

  name = "Alpha"
  color = "#0d80d8"
  description = "Alpha release ring"
  sort_order = 0
  tag_set_id = module.release_ring_tag_set.id
  tag_set_space_id = data.octopusdeploy_space.default.id
}

module "release_ring_beta" {
  source = "../modules/tag"

  name = "Beta"
  color = "#0d80d8"
  description = "Beta release ring"
  sort_order = 1
  tag_set_id = module.release_ring_tag_set.id
  tag_set_space_id = data.octopusdeploy_space.default.id
}

module "release_ring_stable" {
  source = "../modules/tag"

  name = "Stable"
  color = "#0d80d8"
  description = "Stable release ring"
  sort_order = 2
  tag_set_id = module.release_ring_tag_set.id
  tag_set_space_id = data.octopusdeploy_space.default.id
}

module "region_tag_set" {
  source = "../modules/tag_set"

  name = "Region"
  description = "Tag set for regions"
  space_id = data.octopusdeploy_space.default.id
}

module "region_us_west_2" {
  source = "../modules/tag"

  name = "US West 2"
  color = "#0d80d8"
  description = "US West 2 region"
  sort_order = 0
  tag_set_id = module.region_tag_set.id
  tag_set_space_id = data.octopusdeploy_space.default.id
}

module "internal_tenant" {
  source = "../modules/tenant"

  name     = "_Internal"
  description = "Tenant for internal testing"
  space_id = data.octopusdeploy_space.default.id
  tenant_tags = [module.release_ring_alpha.canonical_tag_name] #, module.region_us_west_2.canonical_tag_name]
}

module "customer_a_tenant" {
  source = "../modules/tenant"

  name     = "Customer A"
  description = "Tenant for Customer A"
  space_id = data.octopusdeploy_space.default.id
  tenant_tags = [module.release_ring_beta.canonical_tag_name]
}

module "customer_b_tenant" {
  source = "../modules/tenant"

  name     = "Customer B"
  description = "Tenant for Customer B"
  space_id = data.octopusdeploy_space.default.id
  tenant_tags = [module.release_ring_stable.canonical_tag_name]
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

module "test_project_scheduled_trigger" {
  source = "../modules/project_scheduled_trigger"

  name = "Test Project Scheduled Trigger"
  description = "Testing project scheduled trigger creation via Terraform"
  project_id = module.test_project.id
  space_id = data.octopusdeploy_space.default.id

  schedule_type = "cron_expression_schedule"
  cron_expression = "0 0 06 * * Mon-Fri"
  action_type = "deploy_latest_release_action"
  deploy_latest_release_action_source_environment_id = module.default_dev_test_prod.dev_env_id
  deploy_latest_release_action_destination_environment_id = module.default_dev_test_prod.test_env_id
  deploy_latest_release_action_should_redeploy = true
}