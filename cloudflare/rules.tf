resource "cloudflare_page_rule" "www_quanianitis_com" {
  zone_id  = local.cloudflare_zone_id
  target   = "www.quanianitis.com/*"
  priority = 1
  status   = "active"

  actions {
    forwarding_url {
      url         = "https://quanianitis.com/$1"
      status_code = 301
    }
  }
}
