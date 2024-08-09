terraform {
  required_providers {
    octopusdeploy = {
      source = "OctopusDeployLabs/octopusdeploy"
    }
  }
}

resource "octopusdeploy_team" "team" {
  name               = var.name
  can_be_deleted     = var.can_be_deleted
  can_be_renamed     = var.can_be_renamed
  can_change_members = var.can_change_members
  can_change_roles   = var.can_change_roles
  description        = var.description
  space_id           = var.space_id
  users              = var.users

  dynamic "external_security_group" {
    for_each = var.external_security_groups

    content {
      id                  = external_security_group.value["id"]
      display_name        = external_security_group.value["display_name"]
      display_id_and_name = external_security_group.value["display_id_and_name"]
    }
  }
}
