// quanianitis.com Vault
data "onepassword_vault" "quanianitis_vault" {
  name = "quanianitis.com"
}

// Cloudflare Secrets
data "onepassword_item" "gcp_root" {
  vault = data.onepassword_vault.quanianitis_vault.uuid
  title = "gcp_root"
}
