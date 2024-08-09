terraform {
  required_providers {
    octopusdeploy = {
      source = "OctopusDeployLabs/octopusdeploy"
    }
  }
}

module "dev_env" {
  source = "../../environment"

  providers = {
    octopusdeploy = octopusdeploy
  }

  name       = "Development"
  sort_order = 1
  space_id   = var.space_id
}

module "test_env" {
  source = "../../environment"

  providers = {
    octopusdeploy = octopusdeploy
  }

  name       = "Test"
  sort_order = 2
  space_id   = var.space_id
}

module "staging_env" {
  source = "../../environment"

  providers = {
    octopusdeploy = octopusdeploy
  }

  name       = "Staging"
  sort_order = 3
  space_id   = var.space_id
}

module "prod_env" {
  source = "../../environment"

  providers = {
    octopusdeploy = octopusdeploy
  }

  name       = "Production"
  sort_order = 4
  space_id   = var.space_id
}
