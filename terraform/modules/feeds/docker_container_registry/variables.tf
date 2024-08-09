variable "feed_uri" {
  type    = string
  default = "https://index.docker.io"
}

variable "name" {
  type = string
}

variable "password" {
  type      = string
  sensitive = true
  default   = null
}

variable "registry_path" {
  type    = string
  default = null
}

variable "space_id" {
  type = string
}

variable "username" {
  type    = string
  default = null
}
