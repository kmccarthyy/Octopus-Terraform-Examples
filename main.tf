terraform {
  required_providers {
    octopusdeploy = {
      source = "OctopusDeploy/octopusdeploy"
    }
  }
}

provider "octopusdeploy" {
  address = var.serverURL
  api_key = var.apiKey
}

data "octopusdeploy_users" "octopus_config_service_account" {
  filter = var.octopus_service_account
  take   = 1
}

data "octopusdeploy_teams" "octopus_platform_team" {
  partial_name = var.octopus_platform_team
  take   = 1
}

resource "octopusdeploy_space" "kellys_space" {
  description                 = "Kellys managed space"
  name                        = "Kellys Team Space"
  is_default                  = false
  is_task_queue_stopped       = false
  space_managers_team_members = [data.octopusdeploy_users.octopus_config_service_account.users[0].id]
  space_managers_teams        = [data.octopusdeploy_teams.octopus_platform_team.teams[0].id]
}

