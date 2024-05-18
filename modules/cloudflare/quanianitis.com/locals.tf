locals {
  zones = yamldecode(file("${path.module}/zones.yaml"))
  records = {
    "${var.zone_name}" = {
      a     = "${var.a_records}"
      aaaa  = "${var.aaaa_records}"
      ns    = "${var.ns_records}"
      cname = "${var.cname_records}"
      txt   = "${var.txt_records}"
      mx    = "${var.mx_records}"
    }
  }
}

locals {
  a_single_values = {
    for name, record in local.records["${var.zone_name}"].a : name => {
      zone_id = local.zones["${var.zone_name}"].id
      name    = name
      value   = record.value[0]
      proxied = lookup(record, "proxied", false)
      ttl     = lookup(record, "ttl", 1)
    } if length(record.value) == 1
  }
  a_multi_values = {
    for name, record in local.records["${var.zone_name}"].a : name => {
      zone_id = local.zones["${var.zone_name}"].id
      name    = name
      value   = record.value
      proxied = lookup(record, "proxied", false)
      ttl     = lookup(record, "ttl", 1)
    } if length(record.value) > 1
  }
  a_final = flatten([
    for name, record in local.a_multi_values :
    {
      for _, value in record.value :
      "${name}-${value}" => {
        zone_id = local.zones["${var.zone_name}"].id
        name    = name
        value   = value
        proxied = lookup(record, "proxied", false)
        ttl     = lookup(record, "ttl", 1)
      }
    }
  ])
  a_rendered = merge(
    local.a_single_values,
    local.a_final...
  )
}

locals {
  single_values_aaaa = {
    for name, record in local.records["${var.zone_name}"].aaaa : name => {
      zone_id = local.zones["${var.zone_name}"].id
      name    = name
      value   = record.value[0]
      proxied = lookup(record, "proxied", false)
      ttl     = lookup(record, "ttl", 1)
    } if length(record.value) == 1
  }
  multi_values_aaaa = {
    for name, record in local.records["${var.zone_name}"].aaaa : name => {
      zone_id = local.zones["${var.zone_name}"].id
      name    = name
      value   = record.value
      proxied = lookup(record, "proxied", false)
      ttl     = lookup(record, "ttl", 1)
    } if length(record.value) > 1
  }
  final_aaaa = flatten([
    for name, record in local.multi_values_aaaa :
    {
      for _, value in record.value :
      "${name}-${value}" => {
        zone_id = local.zones["${var.zone_name}"].id
        name    = name
        value   = value
        proxied = lookup(record, "proxied", false)
        ttl     = lookup(record, "ttl", 1)
      }
    }
  ])
  rendered_aaaa = merge(
    local.single_values_aaaa,
    local.final_aaaa...
  )
}

locals {
  ns_single_values = {
    for name, record in local.records[var.zone_name].ns : name => {
      zone_id = local.zones["${var.zone_name}"].id
      name    = name
      value   = record.value[0]
      ttl     = lookup(record, "ttl", 1)
      comment = lookup(record, "comment", "")
    } if length(record.value) == 1
  }
  ns_multi_values = {
    for name, record in local.records["${var.zone_name}"].ns : name => {
      zone_id = local.zones["${var.zone_name}"].id
      name    = name
      value   = record.value
      ttl     = lookup(record, "ttl", 1)
      comment = lookup(record, "comment", "")
    } if length(record.value) > 1
  }
  ns_final = flatten([
    for name, record in local.ns_multi_values :
    {
      for _, value in record.value :
      "${name}-${value}" => {
        zone_id = local.zones["${var.zone_name}"].id
        name    = name
        value   = value
        ttl     = lookup(record, "ttl", 1)
        comment = lookup(record, "comment", "")
      }
    }
  ])
  ns_rendered = merge(
    local.ns_single_values,
    local.ns_final...
  )
}

locals {
  txt_single_values = {
    for name, record in local.records["${var.zone_name}"].txt : name => {
      zone_id = local.zones["${var.zone_name}"].id
      name    = name
      value   = record.value[0]
      ttl     = lookup(record, "ttl", 1)
      comment = lookup(record, "comment", "")
    } if length(record.value) == 1
  }
  txt_multi_values = {
    for name, record in local.records["${var.zone_name}"].txt : name => {
      zone_id = local.zones["${var.zone_name}"].id
      name    = name
      value   = record.value
      ttl     = lookup(record, "ttl", 1)
      comment = lookup(record, "comment", "")
    } if length(record.value) > 1
  }
  txt_final = flatten([
    for name, record in local.txt_multi_values :
    {
      for _, value in record.value :
      "${name}-${value}" => {
        zone_id = local.zones["${var.zone_name}"].id
        name    = name
        value   = value
        ttl     = lookup(record, "ttl", 1)
        comment = lookup(record, "comment", "")
      }
    }
  ])
  txt_rendered = merge(
    local.txt_single_values,
    local.txt_final...
  )
}
