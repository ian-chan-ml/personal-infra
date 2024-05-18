// 1password item uuid
locals {
  quanianitis_cloudflare_api_key              = "haqxgdfwtqnvj357u53dlpda7e"
  quanianitis_cloudflare_zone                 = "fwljudrcvdjzzszuu5oo2jtae4"
  quanianitis_cloudflare_api_token_full_write = "xyrk5qkoqrnvmxuihpfb6npwkq"
  quanianitis_cloudflare_api_token_full_read  = "qt5qmbmnunq6vc6bga7hgb2djm"
}

// quanianitis.com Vault
data "onepassword_vault" "quanianitis_vault" {
  name = "quanianitis.com"
}

// Cloudflare Secrets
data "onepassword_item" "cloudflare_zone" {
  vault = data.onepassword_vault.quanianitis_vault.uuid
  uuid  = local.quanianitis_cloudflare_zone
}

data "onepassword_item" "cloudflare_api_key" {
  vault = data.onepassword_vault.quanianitis_vault.uuid
  uuid  = local.quanianitis_cloudflare_api_key
}

data "onepassword_item" "cloudflare_token_full_write" {
  vault = data.onepassword_vault.quanianitis_vault.uuid
  uuid  = local.quanianitis_cloudflare_api_token_full_write
}

data "onepassword_item" "cloudflare_token_full_read" {
  vault = data.onepassword_vault.quanianitis_vault.uuid
  uuid  = local.quanianitis_cloudflare_api_token_full_read
}
