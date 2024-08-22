variable "name" {
  type = string
}

variable "private_key_file" {
  type      = string
  sensitive = true
}

variable "space_id" {
  type = string
}

variable "username" {
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

variable "private_key_passphrase" {
  type      = string
  sensitive = true
  default = null
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
