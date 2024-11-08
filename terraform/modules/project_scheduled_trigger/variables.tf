variable "channel_id" {
  type = string
  default = null
}

variable "name" {
  type = string
}

variable "schedule_type" {
  type = string
}

variable "continuous_daily_schedule_days_of_week" {
  type    = list(string)
  default = []
}

variable "continuous_daily_schedule_interval" {
  type    = number
  default = 60  
}

variable "continuous_daily_schedule_run_after" {
  type    = string
  default = "00:00:00"
}

variable "continuous_daily_schedule_run_until" {
  type    = string
  default = "00:00:00"
}

variable "continuous_daily_schedule_hour_interval" {
  type    = string
  default = null
}

variable "continuous_daily_schedule_minute_interval" {
  type    = string
  default = null
}

variable "cron_expression" {
  type    = string
  default = null
}

variable "days_per_month_schedule_monthly_schedule_type" {
  type = string
  default = null
}

variable "days_per_month_schedule_start_time" {
  type = string
  default = "00:00:00"
}

variable "days_per_month_schedule_date_of_month" {
  type = string
  default = null
}

variable "days_per_month_schedule_day_number_of_month" {
  type = string
  default = null
}

variable "days_per_month_schedule_day_of_week" {
  type = string
  default = null
}

variable "action_type" {
  type = string
}

variable "deploy_latest_release_action_destination_environment_id" {
  type = string
  default = null
}

variable "deploy_latest_release_action_source_environment_id" {
  type = string
  default = null
}

variable "deploy_latest_release_action_should_redeploy" {
  type = bool
  default = false
}

variable "deploy_new_release_action_destination_environment_id" {
  type = string
  default = null
}

variable "deploy_new_release_action_git_reference" {
  type = string
  default = null
}

variable "once_daily_schedule_days_of_week" {
  type    = list(string)
  default = []
}

variable "once_daily_schedule_start_time" {
  type    = string
  default = "00:00:00"
}

variable "run_runbook_action_runbook_id" {
  type = string
  default = null
}

variable "run_runbook_action_target_environment_ids" {
  type = list(string)
  default = []
}

variable "description" {
  type    = string
  default = null
}

variable "is_disabled" {
  type    = bool
  default = false
}

variable "project_id" {
  type    = string
}

variable "space_id" {
  type    = string
}

variable "tenant_ids" {
  type    = list(string)
  default = []
}

variable "timezone" {
  type    = string
  default = null
}