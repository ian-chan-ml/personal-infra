module "staging_quanianitis_com" {
  source = "../../modules/cloudflare/zero-trust/access"

  account_id = local.cloudflare_account_id

  name             = "staging.quanianitis.com"
  domain           = "staging.quanianitis.com"
  type             = "self_hosted"
  session_duration = "0s"

  policies = {
    "staging-auth" = {
      "include_auth_method"  = ["fpt"]
      "require_email_domain" = ["quanianitis.com"]
    }
  }
  decision                  = "allow" # AKA Service Auth
  service_auth_401_redirect = true
}


