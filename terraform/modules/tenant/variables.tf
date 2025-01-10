variable "name" {
  type = string
}

variable "description" {
  type    = string
  default = null
}

variable "is_disabled" {
  type    = bool
  default = false
}

variable "space_id" {
  type    = string
}

variable "tenant_tags" {
  type    = list(string)
  default = []
}
