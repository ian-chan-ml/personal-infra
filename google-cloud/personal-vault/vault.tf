// quanianitis.com Vault
data "onepassword_vault" "quanianitis_vault" {
  name = "quanianitis.com"
}

// Sendgrid Secrets
data "onepassword_item" "sendgrid_api_key" {
  vault = data.onepassword_vault.quanianitis_vault.uuid
  title = "sendgrid_api_key"
}
