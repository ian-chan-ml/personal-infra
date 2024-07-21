terraform {
  backend "gcs" {
    bucket             = "quanianitis-terraform-state-backend"
    prefix             = "cloudflare/majestydecoration"
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
  cloudflare_zone_id    = sensitive("5338cfaf476676a00f4096beafda383e") // majestydecoration.com
  cloudflare_account_id = sensitive("f827bd12792de26374f50f0cd6064bbc") // quanianitis@gmail.com
}
