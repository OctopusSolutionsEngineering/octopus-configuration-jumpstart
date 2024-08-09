variable "access_key" {
  type = string
}

variable "name" {
  type = string
}

variable "secret_key" {
  type      = string
  sensitive = true
}

variable "space_id" {
  type = string
}

# optional

variable "description" {
  type    = string
  default = ""
}

variable "environments" {
  type    = list(string)
  default = []
}

variable "tenant_tags" {
  type    = list(string)
  default = []
}

variable "tenanted_deployment_participation" {
  type    = string
  default = "Untenanted"
}

variable "tenants" {
  type    = list(string)
  default = []
}
