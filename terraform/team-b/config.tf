terraform {
  required_providers {
    octopusdeploy = {
      source = "OctopusDeployLabs/octopusdeploy", version = "0.39.0"
    }
  }
}

provider "octopusdeploy" {
}
