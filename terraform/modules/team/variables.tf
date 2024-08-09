variable "name" {
  type = string
}

variable "can_be_deleted" {
  type    = bool
  default = null
}

variable "can_be_renamed" {
  type    = bool
  default = null
}

variable "can_change_members" {
  type    = bool
  default = null
}

variable "can_change_roles" {
  type    = bool
  default = null
}

variable "description" {
  type    = string
  default = null
}

variable "external_security_groups" {
  type = list(object({
    id                  = string
    display_name        = string
    display_id_and_name = bool
  }))
  default = []
}

variable "space_id" {
  type    = string
  default = null
}

variable "users" {
  type    = set(string)
  default = []
}
