variable "feed_uri" {
  type = string
}

variable "name" {
  type = string
}

variable "repository" {
  type = string
}

# optional

variable "layout_regex" {
  type    = string
  default = null
}

variable "password" {
  type      = string
  sensitive = true
  default   = null
}

variable "space_id" {
  type = string
}

variable "username" {
  type    = string
  default = null
}
