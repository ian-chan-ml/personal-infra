module "cloudflare_quanianitis_com" {
  source = "../../modules/cloudflare/quanianitis.com"

  zone_name = "quanianitis.com"

  cname_records = yamldecode(file("${path.module}/quanianitis.com/cname.yaml"))
  a_records     = yamldecode(file("${path.module}/quanianitis.com/a.yaml"))
  mx_records    = yamldecode(file("${path.module}/quanianitis.com/mx.yaml"))
  txt_records   = yamldecode(file("${path.module}/quanianitis.com/txt.yaml"))
}
