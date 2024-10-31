variable "name" {
  type = string
}

variable "description" {
  type    = string
  default = null
}

variable "space_id" {
  type    = string
  default = null
}

variable "tenant_tags" {
  type    = list(string)
  default = []
}
