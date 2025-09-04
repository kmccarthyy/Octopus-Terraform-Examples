variable "apiKey" {
    type = string
}

variable "serverURL" {
    type = string
}

variable "octopus_service_account" {
  type    = string
  default = "Platform Team Service account"
}

variable "octopus_platform_team" {
  type    = string
  default = "Platform Management team"
}
