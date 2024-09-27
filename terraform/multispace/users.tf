data "octopusdeploy_users" "octopus_config_service_account" {
  filter = var.octopus_service_account
  take   = 1
}

data "octopusdeploy_users" "ryan_rousseau" {
  filter = "Ryan Rousseau"
  take   = 1
}
