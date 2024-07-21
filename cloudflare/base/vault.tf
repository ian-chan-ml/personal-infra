// quanianitis.com Vault
data "onepassword_vault" "quanianitis_vault" {
  name = "quanianitis.com"
}

// Cloudflare Secrets
data "onepassword_item" "cloudflare_api_key" {
  vault = data.onepassword_vault.quanianitis_vault.uuid
  title = "cloudflare_api_key"
}

data "onepassword_item" "cloudflare_token_full_write" {
  vault = data.onepassword_vault.quanianitis_vault.uuid
  title = "cloudflare_api_token_full_write"
}

data "onepassword_item" "cloudflare_token_full_read" {
  vault = data.onepassword_vault.quanianitis_vault.uuid
  title = "cloudflare_api_token_full_read"
}
