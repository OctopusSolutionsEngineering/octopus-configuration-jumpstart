variable "environment_id" {
  type = string
}

variable "project_id" {
  type = string
}

variable "space_id" {
  type    = string
}

variable "template_id" {
  type = string
}

variable "tenant_id" {
  type = string
}

variable "value" {
  type      = string
  sensitive = true
  default   = null
}
