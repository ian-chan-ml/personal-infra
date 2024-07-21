variable "account_id" {
  type    = string
  default = ""
}

variable "name" {
  type = string
}

variable "domain" {
  type = string
}

variable "type" {
  type = string
}

variable "session_duration" {
  type = string
}

variable "allowed_idps" {
  type    = list(string)
  default = []
}

variable "auto_redirect_to_identity" {
  type    = bool
  default = true
}

variable "http_only_cookie_attribute" {
  type    = bool
  default = false
}

variable "policies" {}

variable "decision" {
  type = string
}

variable "service_auth_401_redirect" {
  type    = bool
  default = false
}
