module "quanianitis" {
  source     = "../modules/cloudflare/pages"
  account_id = local.cloudflare_account_id

  project_name      = "quanianitis"
  production_branch = "alt-main"

  preview_environment_variables    = {}
  production_environment_variables = {}

  preview_compatibility_date    = "2024-04-28"
  production_compatibility_date = "2024-04-28"
  compatibility_flags           = ["nodejs_compat"]

  domain = ["quanianitis.com"]

  build_config = {
    build_caching   = true
    build_command   = "npx @cloudflare/next-on-pages@1"
    destination_dir = "/.vercel/output/static"
  }
}
