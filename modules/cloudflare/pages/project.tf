resource "cloudflare_pages_project" "this" {
  account_id        = var.account_id
  name              = var.project_name
  production_branch = var.production_branch

  build_config {
    build_command       = var.build_config.build_command
    destination_dir     = var.build_config.destination_dir
    root_dir            = var.build_config.root_dir
    web_analytics_tag   = var.build_config.web_analytics_tag
    web_analytics_token = var.build_config.web_analytics_token
  }

  deployment_configs {
    preview {
      environment_variables = var.preview_environment_variables
      compatibility_date    = var.preview_compatibility_date
      compatibility_flags   = var.compatibility_flags
    }
    production {
      environment_variables = var.production_environment_variables
      compatibility_date    = var.production_compatibility_date
      compatibility_flags   = var.compatibility_flags
    }
  }

  lifecycle {
    ignore_changes = [
      deployment_configs[0].preview[0].usage_model,
      deployment_configs[0].production[0].usage_model,
      source,
    ]
  }
}
