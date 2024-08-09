module "managed_space_2" {
  source = "./modules/space"

  providers = {
    octopusdeploy = octopusdeploy
  }

  name        = "Managed Space 2"
  description = "Second space created with the TF jumpstart"
  space_managers_teams  = [module.platform_engineering_team.id]
  is_task_queue_stopped = false
}

module "managed_space_2_dev_test_staging_prod" {
  source = "./modules/preset_envs/dev_test_staging_prod"

  providers = {
    octopusdeploy = octopusdeploy
  }

  space_id = module.managed_space_2.id
}

module "managed_space_2_dev_team" {
  source = "./modules/team"

  providers = {
    octopusdeploy = octopusdeploy
  }

  name        = "Dev Team"
  description = "Dev team for Managed Space 2"
  space_id    = module.managed_space_2.id
  #external_security_groups = [
  #    {
  #        id = "externalGroupId"
  #        display_name = "External Group Name"
  #        display_id_and_name = true
  #    }
  #]
  users = [] #[data.octopusdeploy_users.ryan_rousseau.users[0].id]
}

resource "octopusdeploy_scoped_user_role" "managed_space_2_dev_team_project_contributor" {
  space_id        = module.managed_space_2.id
  team_id         = module.managed_space_2_dev_team.id
  user_role_id    = "userroles-projectcontributor"
  environment_ids = []
  # project_group_ids = []
  # project_ids = []
  # tenant_ids = []
}

resource "octopusdeploy_scoped_user_role" "managed_space_2_dev_team_deployment_creator" {
  space_id        = module.managed_space_2.id
  team_id         = module.managed_space_2_dev_team.id
  user_role_id    = "userroles-deploymentcreator"
  environment_ids = [module.managed_space_2_dev_test_staging_prod.dev_env_id]
}

module "managed_space_2_qa_team" {
  source = "./modules/team"

  providers = {
    octopusdeploy = octopusdeploy
  }

  name        = "QA Team"
  description = "QA team for Managed Space 2"
  space_id    = module.managed_space_2.id
  #external_security_groups = [
  #    {
  #        id = "externalGroupId"
  #        display_name = "External Group Name"
  #        display_id_and_name = true
  #    }
  #]
  users = [] #[data.octopusdeploy_users.ryan_rousseau.users[0].id]
}

resource "octopusdeploy_scoped_user_role" "managed_space_2_qa_team_deployment_creator" {
  space_id        = module.managed_space_2.id
  team_id         = module.managed_space_2_qa_team.id
  user_role_id    = "userroles-deploymentcreator"
  environment_ids = [module.managed_space_2_dev_test_staging_prod.test_env_id]
}

module "managed_space_2_docker_registry" {
  source = "./modules/feeds/docker_container_registry"

  name     = "Docker Hub"
  space_id = module.managed_space_2.id
}

module "managed_space_2_helm_feed" {
  source = "./modules/feeds/helm_feed"

  name     = "Helm - Stable"
  space_id = module.managed_space_2.id
}
