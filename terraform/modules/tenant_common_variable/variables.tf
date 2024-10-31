variable "library_variable_set_id" {
  type = string
}

variable "space_id" {
  type    = string
  default = null
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
