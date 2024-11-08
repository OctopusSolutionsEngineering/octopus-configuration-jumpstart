terraform {
  required_providers {
    octopusdeploy = {
      source = "OctopusDeployLabs/octopusdeploy"
    }
  }
}

resource "octopusdeploy_project_scheduled_trigger" "trigger" {
  name               = var.name
  description        = var.description
  space_id           = var.space_id
  project_id         = var.project_id

  channel_id = var.channel_id

  dynamic "continuous_daily_schedule" {
    for_each = var.schedule_type == "continuous_daily_schedule" ? [1] : []
    content {
      days_of_week = var.continuous_daily_schedule_days_of_week
      interval = var.continuous_daily_schedule_interval
      run_after = var.continuous_daily_schedule_run_after
      run_until = var.continuous_daily_schedule_run_until
      hour_interval = var.continuous_daily_schedule_hour_interval
      minute_interval = var.continuous_daily_schedule_minute_interval
    }
  }

  dynamic "cron_expression_schedule" {
    for_each = var.schedule_type == "cron_expression_schedule" ? [1] : []
    content {
      cron_expression = var.cron_expression
    }
  }

  dynamic "days_per_month_schedule" {
    for_each = var.schedule_type == "days_per_month_schedule" ? [1] : []
    content {
      monthly_schedule_type = var.days_per_month_schedule_monthly_schedule_type
      start_time = var.days_per_month_schedule_start_time
      date_of_month = var.days_per_month_schedule_date_of_month
      day_number_of_month = var.days_per_month_schedule_day_number_of_month
      day_of_week = var.days_per_month_schedule_day_of_week
    }
  }

  dynamic "deploy_latest_release_action" {
    for_each = var.action_type == "deploy_latest_release_action" ? [1] : []
    content {
      destination_environment_id = var.deploy_latest_release_action_destination_environment_id
      source_environment_id = var.deploy_latest_release_action_source_environment_id
      should_redeploy = var.deploy_latest_release_action_should_redeploy
    }
  }

  dynamic "deploy_new_release_action" {
    for_each = var.action_type == "deploy_new_release_action" ? [1] : []
    content {
      destination_environment_id = var.deploy_new_release_action_destination_environment_id
      git_reference = var.deploy_new_release_action_git_reference
    }
  }

  dynamic "once_daily_schedule" {
    for_each = var.schedule_type == "once_daily_schedule" ? [1] : []
    content {
      days_of_week = var.once_daily_schedule_days_of_week
      start_time = var.once_daily_schedule_start_time
    }
  }

  dynamic "run_runbook_action" {
    for_each = var.action_type == "runbook_run_action" ? [1] : []
    content {
      runbook_id = var.run_runbook_action_runbook_id
      target_environment_ids = var.run_runbook_action_target_environment_ids
    }
  }
}
