terraform {
  required_providers {
    octopusdeploy = {
      source = "OctopusDeployLabs/octopusdeploy", version = "0.30.6"
    }
  }
}

provider "octopusdeploy" {
}
