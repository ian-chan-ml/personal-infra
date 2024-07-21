resource "cloudflare_access_application" "this" {
  account_id                 = var.account_id
  name                       = var.name
  domain                     = var.domain
  type                       = var.type
  session_duration           = var.session_duration
  allowed_idps               = var.allowed_idps == [] ? null : var.allowed_idps
  auto_redirect_to_identity  = var.auto_redirect_to_identity
  http_only_cookie_attribute = var.http_only_cookie_attribute
  service_auth_401_redirect  = var.service_auth_401_redirect

  policies = [for policy in cloudflare_access_policy.this : policy.id]
}

resource "cloudflare_access_policy" "this" {
  for_each   = { for k, v in var.policies : k => v }
  account_id = var.account_id
  name       = each.key
  decision   = var.decision #allow, deny, non_identity, bypass
  dynamic "include" {
    for_each = lookup(each.value, "include_ip", []) != [] ? toset(each.value.include_ip) : []
    content {
      ip = include.value
    }
  }
  dynamic "include" {
    for_each = lookup(each.value, "include_email_domain", []) != [] ? toset(each.value.include_email_domain) : []
    content {
      email_domain = [include.value]
    }
  }
  dynamic "include" {
    for_each = lookup(each.value, "include_service_token", []) != [] ? toset(each.value.include_service_token) : []
    content {
      service_token = [include.value]
    }
  }

  dynamic "include" {
    for_each = lookup(each.value, "include_auth_method", []) != [] ? toset(each.value.include_auth_method) : []
    content {
      auth_method = include.value
    }
  }

  dynamic "include" {
    for_each = lookup(each.value, "include_everyone", false) == true ? [1] : []
    content {
      everyone = true
    }
  }

  dynamic "require" {
    for_each = lookup(each.value, "require_email_domain", []) != [] ? toset(each.value.require_email_domain) : []
    content {
      email_domain = [require.value]
    }
  }
}
