variable "feed_uri" {
  type    = string
  default = "https://repo.maven.apache.org/maven2/"
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
