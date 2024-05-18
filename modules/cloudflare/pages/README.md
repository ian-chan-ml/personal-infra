<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_cloudflare"></a> [cloudflare](#provider\_cloudflare) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [cloudflare_pages_domain.this](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/pages_domain) | resource |
| [cloudflare_pages_project.this](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/pages_project) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_account_id"></a> [account\_id](#input\_account\_id) | cloudflare account id | `string` | n/a | yes |
| <a name="input_cf_list_name"></a> [cf\_list\_name](#input\_cf\_list\_name) | Cloudflare List Name | `string` | `"cf_pages_subdomain"` | no |
| <a name="input_compatibility_flags"></a> [compatibility\_flags](#input\_compatibility\_flags) | Compatibility flags used for Pages Functions. | `list(string)` | `[]` | no |
| <a name="input_domain"></a> [domain](#input\_domain) | cloudflare pages custom domain name | `list(string)` | `[]` | no |
| <a name="input_include_subdomains"></a> [include\_subdomains](#input\_include\_subdomains) | Cloudflare List Include Subdomains | `bool` | `false` | no |
| <a name="input_preserve_path_suffix"></a> [preserve\_path\_suffix](#input\_preserve\_path\_suffix) | Cloudflare List Preserve Path Suffix | `bool` | `true` | no |
| <a name="input_preserve_query_string"></a> [preserve\_query\_string](#input\_preserve\_query\_string) | Cloudflare List Preserve Query String | `bool` | `true` | no |
| <a name="input_preview_compatibility_date"></a> [preview\_compatibility\_date](#input\_preview\_compatibility\_date) | Compatibility date used for Pages Functions. | `string` | n/a | yes |
| <a name="input_preview_environment_variables"></a> [preview\_environment\_variables](#input\_preview\_environment\_variables) | n/a | `map(any)` | n/a | yes |
| <a name="input_production_branch"></a> [production\_branch](#input\_production\_branch) | n/a | `string` | `"master"` | no |
| <a name="input_production_compatibility_date"></a> [production\_compatibility\_date](#input\_production\_compatibility\_date) | Compatibility date used for Pages Functions. | `string` | n/a | yes |
| <a name="input_production_environment_variables"></a> [production\_environment\_variables](#input\_production\_environment\_variables) | n/a | `map(any)` | n/a | yes |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | Cloudflare Project Name | `string` | n/a | yes |
| <a name="input_status_code"></a> [status\_code](#input\_status\_code) | Cloudflare List Status Code | `number` | `301` | no |
| <a name="input_subpath_matching"></a> [subpath\_matching](#input\_subpath\_matching) | Cloudflare List Subpath Matching | `bool` | `true` | no |
| <a name="input_target_url"></a> [target\_url](#input\_target\_url) | Cloudflare List Target URL | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_domain"></a> [domain](#output\_domain) | n/a |
| <a name="output_pages"></a> [pages](#output\_pages) | n/a |
<!-- END_TF_DOCS -->