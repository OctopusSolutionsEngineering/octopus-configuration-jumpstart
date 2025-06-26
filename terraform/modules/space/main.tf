terraform {
  required_providers {
    octopusdeploy = {
      source = "OctopusDeploy/octopusdeploy"
    }
  }
}

resource "octopusdeploy_space" "space" {
  description                 = var.description
  name                        = var.name
  is_default                  = false
  is_task_queue_stopped       = var.is_task_queue_stopped
  space_managers_team_members = var.space_managers_team_members
  space_managers_teams        = var.space_managers_teams
}
