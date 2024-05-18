provider "onepassword" {
  account = "MYYEEZXFJBEGVCJPHRY7PJZDDI"
}

provider "cloudflare" {
  api_token = data.onepassword_item.cloudflare_token_full_write.password
}

// Cloudflare Locals
locals {
  cloudflare_zone       = "53242703e6acff8c4fd67843553da276" // quanianitis.com
  cloudflare_account_id = "f827bd12792de26374f50f0cd6064bbc" // quanianitis@gmail.com
}
