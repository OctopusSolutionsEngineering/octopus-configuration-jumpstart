terraform {
  required_providers {
    octopusdeploy = {
      source = "OctopusDeployLabs/octopusdeploy", version = "0.35.0"
    }
  }
}

provider "octopusdeploy" {
}
