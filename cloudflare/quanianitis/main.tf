terraform {
  backend "gcs" {
    bucket             = "quanianitis-terraform-state-backend"
    prefix             = "cloudflare/quanianitis"
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
  cloudflare_zone_id    = sensitive("53242703e6acff8c4fd67843553da276") // quanianitis.com
  cloudflare_account_id = sensitive("f827bd12792de26374f50f0cd6064bbc") // quanianitis@gmail.com
}
