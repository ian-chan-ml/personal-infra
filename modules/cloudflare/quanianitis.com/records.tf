resource "cloudflare_record" "a_records" {
  for_each = local.a_rendered
  zone_id  = each.value.zone_id
  name     = each.value.name
  value    = each.value.value
  type     = "A"
  proxied  = each.value.proxied
  ttl      = each.value.ttl
}

resource "cloudflare_record" "aaaa_records" {
  for_each = local.rendered_aaaa
  zone_id  = each.value.zone_id
  name     = each.value.name
  value    = each.value.value
  type     = "AAAA"
  proxied  = each.value.proxied
  ttl      = each.value.ttl
}


resource "cloudflare_record" "ns_records" {
  for_each = local.ns_rendered

  zone_id = local.zones["${var.zone_name}"].id
  name    = each.value.name
  value   = each.value.value
  type    = "NS"
  ttl     = each.value.ttl
  comment = each.value.comment
}

resource "cloudflare_record" "cname_records" {
  for_each = local.records["${var.zone_name}"].cname

  zone_id = local.zones["${var.zone_name}"].id
  name    = each.key
  value   = lower(each.value.value) # Cloudflare lowercases CNAME records in their system
  type    = "CNAME"
  proxied = lookup(each.value, "proxied", false)
  ttl     = lookup(each.value, "ttl", 1)
  comment = lookup(each.value, "comment", "")
}

resource "cloudflare_record" "txt_records" {
  for_each = local.txt_rendered

  zone_id = local.zones["${var.zone_name}"].id
  name    = each.value.name
  value   = each.value.value
  type    = "TXT"
  ttl     = lookup(each.value, "ttl", 1)
  comment = each.value.comment
}

resource "cloudflare_record" "mx_records" {
  for_each = { for record in local.records["${var.zone_name}"].mx : record.record_name => record }

  zone_id  = local.zones["${var.zone_name}"].id
  name     = lookup(each.value, "name", "@")
  type     = "MX"
  value    = each.value.value
  priority = each.value.priority
  ttl      = lookup(each.value, "ttl", 1)
}
