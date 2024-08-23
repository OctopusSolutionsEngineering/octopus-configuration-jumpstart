variable "feed_uri" {
  type = string
}

variable "name" {
  type = string
}

variable "download_attempts" {
  type    = number
  default = 5
}

variable "download_retry_backoff_seconds" {
  type    = number
  default = 10
}

variable "is_enahanced_mode" {
  type    = bool
  default = false
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
