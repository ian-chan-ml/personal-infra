module "quanianitis" {
  source     = "../modules/cloudflare/pages"
  account_id = local.cloudflare_account_id

  project_name      = "quanianitis"
  production_branch = "main"

  preview_environment_variables = {
    HUGO_VERSION = "0.120.0"
  }
  production_environment_variables = {
    HUGO_VERSION = "0.120.0"
  }

  preview_compatibility_date    = "2024-04-28"
  production_compatibility_date = "2024-04-28"

  domain = ["quanianitis.com"]

  build_config = {
    build_caching   = true
    build_command   = "hugo --config main/config.yaml"
    destination_dir = "public"
  }
}
