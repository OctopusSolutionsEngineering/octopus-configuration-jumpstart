terraform {
  required_providers {
    octopusdeploy = {
      source = "OctopusDeployLabs/octopusdeploy", version = "0.30.0-beta3"
    }
  }
}

provider "octopusdeploy" {
}
