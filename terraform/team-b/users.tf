data "octopusdeploy_users" "octopus_config_service_account" {
  filter = var.octopus_service_account
  take   = 1
}
