variable "feed_uri" {
  type    = string
  default = "https://charts.helm.sh/stable"
}

variable "name" {
  type = string
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
