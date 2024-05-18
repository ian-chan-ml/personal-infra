# data "cloudflare_list" "this" {
#   account_id = var.account_id
#   name       = var.cf_list_name
# }

# resource "cloudflare_list_item" "this" {


#   account_id = var.account_id
#   list_id    = data.cloudflare_list.this.id
#   redirect {
#     source_url            = "${var.project_name}.pages.dev/" # xxx.pages.dev
#     target_url            = var.target_url                   #url to redirect to ex. xx.moneylion.com
#     status_code           = var.status_code
#     preserve_path_suffix  = var.preserve_path_suffix
#     include_subdomains    = var.include_subdomains
#     preserve_query_string = var.preserve_query_string
#     subpath_matching      = var.subpath_matching
#   }
# }
