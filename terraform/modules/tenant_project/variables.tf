variable "environment_ids" {
  type    = list(string)
  default = []
}

variable "project_id" {
  type = string
}

variable "tenant_id" {
  type    = string
  default = null
}

variable "space_id" {
  type    = string
}
