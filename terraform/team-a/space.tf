module "team_a_space" {
  source = "../modules/space"

  providers = {
    octopusdeploy = octopusdeploy
  }

  name        = "Team A's Space"
  description = "Managed space for Team A"
  space_managers_team_members = [data.octopusdeploy_users.octopus_config_service_account.users[0].id]
  is_task_queue_stopped = false
}

module "team_a_space_dev_test_prod" {
  source = "../modules/preset_envs/dev_test_prod"

  providers = {
    octopusdeploy = octopusdeploy
  }

  space_id = module.team_a_space.id
}

module "team_a_space_dev_team" {
  source = "../modules/team"

  providers = {
    octopusdeploy = octopusdeploy
  }

  name        = "Dev Team"
  description = "Dev team for Managed Space 1"
  space_id    = module.team_a_space.id
  #external_security_groups = [
  #    {
  #        id = "externalGroupId"
  #        display_name = "External Group Name"
  #        display_id_and_name = true
  #    }
  #]
  users = []
}

resource "octopusdeploy_scoped_user_role" "team_a_space_dev_team_project_contributor" {
  space_id        = module.team_a_space.id
  team_id         = module.team_a_space_dev_team.id
  user_role_id    = "userroles-projectcontributor"
  environment_ids = []
  # project_group_ids = []
  # project_ids = []
  # tenant_ids = []
}

resource "octopusdeploy_scoped_user_role" "team_a_space_dev_team_deployment_creator" {
  space_id        = module.team_a_space.id
  team_id         = module.team_a_space_dev_team.id
  user_role_id    = "userroles-deploymentcreator"
  environment_ids = [module.team_a_space_dev_test_prod.dev_env_id]
}

module "team_a_space_qa_team" {
  source = "../modules/team"

  providers = {
    octopusdeploy = octopusdeploy
  }

  name        = "QA Team"
  description = "QA team for Managed Space 1"
  space_id    = module.team_a_space.id
  #external_security_groups = [
  #    {
  #        id = "externalGroupId"
  #        display_name = "External Group Name"
  #        display_id_and_name = true
  #    }
  #]
  users = [] #[data.octopusdeploy_users.ryan_rousseau.users[0].id]
}

resource "octopusdeploy_scoped_user_role" "team_a_space_qa_team_deployment_creator" {
  space_id        = module.team_a_space.id
  team_id         = module.team_a_space_qa_team.id
  user_role_id    = "userroles-deploymentcreator"
  environment_ids = [module.team_a_space_dev_test_prod.test_env_id]
}

module "team_a_space_docker_registry" {
  source = "../modules/feeds/docker_container_registry"

  name     = "Docker Hub"
  space_id = module.team_a_space.id
}

module "team_a_space_helm_feed" {
  source = "../modules/feeds/helm_feed"

  name     = "Helm - Stable"
  space_id = module.team_a_space.id
}
