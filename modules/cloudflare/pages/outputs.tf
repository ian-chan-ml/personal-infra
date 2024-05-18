output "pages" {
  value = cloudflare_pages_project.this
}

output "domain" {
  value = { for domain in var.domain : domain => cloudflare_pages_domain.this[domain] }
}
