terraform {
  backend "gcs" {
    bucket             = "quanianitis-terraform-state-backend"
    prefix             = "cloudflare/base"
    kms_encryption_key = "projects/base-430103/locations/asia-southeast1/keyRings/infrastructure/cryptoKeys/terraform-backend"
  }
}

provider "onepassword" {
  account = "my.1password.com"
}

provider "cloudflare" {
  api_token = data.onepassword_item.cloudflare_token_full_write.password
}

// Cloudflare Locals
locals {
  quanianitis_zone_id       = sensitive("53242703e6acff8c4fd67843553da276") // quanianitis.com
  majestydecoration_zone_id = sensitive("5338cfaf476676a00f4096beafda383e") // majestydecoration.com
  cloudflare_account_id     = sensitive("f827bd12792de26374f50f0cd6064bbc") // quanianitis@gmail.com
}

# resource "cloudflare_zone" "majestydecoration_com" {
#   account_id          = "f827bd12792de26374f50f0cd6064bbc"
#   zone                = "majestydecoration.com"
# }

# resource "cloudflare_zone" "quanianitis_com" {
#   account_id          = "f827bd12792de26374f50f0cd6064bbc"
#   zone                = "quanianitis.com"
# }
