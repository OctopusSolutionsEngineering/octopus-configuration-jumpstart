variable "name" {
  type = string
}

variable "description" {
  type = string
}

variable "is_task_queue_stopped" {
  type    = bool
  default = false
}

variable "space_managers_team_members" {
  type    = list(string)
  default = []
}

variable "space_managers_teams" {
  type    = list(string)
  default = []
}
