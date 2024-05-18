output "cloudflare_api_key" {
  value     = data.onepassword_item.cloudflare_api_key.password
  sensitive = true
}
