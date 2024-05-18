resource "cloudflare_pages_domain" "this" {
  for_each     = var.domain != [] ? toset(var.domain) : []
  account_id   = var.account_id
  project_name = var.project_name
  domain       = each.key

  depends_on = [
    cloudflare_pages_project.this
  ]
}
