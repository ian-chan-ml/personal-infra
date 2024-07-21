locals {
  routing_address = {
    quanianitis_gmail_com = toset(["admin@quanianitis.com", "mail@quanianitis.com", "contact@quanianitis.com", "work@quanianitis.com"])
    exodus931_gmail_com   = toset(["secondary@quanianitis.com", "marketing@quanianitis.com"])
  }
}

resource "cloudflare_email_routing_settings" "quanianitis_com" {
  zone_id = local.cloudflare_zone_id
  enabled = "true"
}

resource "cloudflare_email_routing_address" "quanianitis_gmail_com" {
  account_id = local.cloudflare_account_id
  email      = "quanianitis@gmail.com"
}

resource "cloudflare_email_routing_rule" "quanianitis_gmail_com" {
  for_each = local.routing_address.quanianitis_gmail_com

  zone_id = local.cloudflare_zone_id
  name    = each.value
  enabled = true

  matcher {
    type  = "literal"
    field = "to"
    value = each.value
  }

  action {
    type  = "forward"
    value = [cloudflare_email_routing_address.quanianitis_gmail_com.email]
  }
}

resource "cloudflare_email_routing_address" "exodus931_gmail_com" {
  account_id = local.cloudflare_account_id
  email      = "exodus931@gmail.com"
}

resource "cloudflare_email_routing_rule" "exodus931_gmail_com" {
  for_each = local.routing_address.exodus931_gmail_com

  zone_id = local.cloudflare_zone_id
  name    = each.value
  enabled = true

  matcher {
    type  = "literal"
    field = "to"
    value = each.value
  }

  action {
    type  = "forward"
    value = [cloudflare_email_routing_address.exodus931_gmail_com.email]
  }
}
