variable "project_name" {
  type        = string
  description = "Cloudflare Project Name"
}

variable "production_branch" {
  type    = string
  default = "master"
}

variable "preview_environment_variables" {
  type = map(any)
}

variable "production_environment_variables" {
  type = map(any)
}

variable "preview_compatibility_date" {
  type        = string
  description = "Compatibility date used for Pages Functions."
}

variable "production_compatibility_date" {
  type        = string
  description = "Compatibility date used for Pages Functions."
}

variable "domain" {
  type        = list(string)
  default     = []
  description = "cloudflare pages custom domain name"
}

variable "account_id" {
  type        = string
  description = "cloudflare account id"
}

variable "compatibility_flags" {
  type        = list(string)
  description = "Compatibility flags used for Pages Functions."
  default     = []
}

variable "cf_list_name" {
  type        = string
  description = "Cloudflare List Name"
  default     = "cf_pages_subdomain"
}

variable "target_url" {
  type        = string
  description = "Cloudflare List Target URL"
  default     = null
}

variable "status_code" {
  type        = number
  description = "Cloudflare List Status Code"
  default     = 301
}

variable "preserve_path_suffix" {
  type        = bool
  description = "Cloudflare List Preserve Path Suffix"
  default     = true
}

variable "include_subdomains" {
  type        = bool
  description = "Cloudflare List Include Subdomains"
  default     = false
}

variable "preserve_query_string" {
  type        = bool
  description = "Cloudflare List Preserve Query String"
  default     = true
}

variable "subpath_matching" {
  type        = bool
  description = "Cloudflare List Subpath Matching"
  default     = true
}

variable "build_config" {
  description = "Configuration for pages project build process"
  type = object({
    build_command       = string
    destination_dir     = string
    root_dir            = optional(string, "/")
    web_analytics_tag   = optional(string, "")
    web_analytics_token = optional(string, "")
  })
  default = {
    build_command       = ""
    destination_dir     = ""
    root_dir            = "/"
    web_analytics_tag   = ""
    web_analytics_token = ""
  }
}
