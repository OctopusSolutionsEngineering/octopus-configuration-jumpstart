output "dev_env_id" {
  value = module.dev_env.id
}

output "test_env_id" {
  value = module.test_env.id
}

output "prod_env_id" {
  value = module.prod_env.id
}

output "standard_lifecycle_id" {
  value = octopusdeploy_lifecycle.standard_lifecycle.id
}
