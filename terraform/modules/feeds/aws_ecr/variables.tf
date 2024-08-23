variable "access_key" {
  type = string
}

variable "name" {
  type = string
}

variable "region" {
  type = string
}

variable "secret_key" {
  type      = string
  sensitive = true
}

variable "space_id" {
  type = string
}
