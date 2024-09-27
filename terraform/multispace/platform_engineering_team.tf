module "platform_engineering_team" {
  source = "../modules/team"

  providers = {
    octopusdeploy = octopusdeploy
  }

  name        = "Platform Engineering Team"
  description = "Global team representing the Platform Engineering team"
  #external_security_groups = [
  #    {
  #        id = "externalGroupId"
  #        display_name = "External Group Name"
  #        display_id_and_name = true
  #    }
  #]
  users = [data.octopusdeploy_users.octopus_config_service_account.users[0].id]
}
