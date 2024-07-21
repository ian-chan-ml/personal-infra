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
| [cloudflare_access_application.this](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/access_application) | resource |
| [cloudflare_access_policy.this_policy](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/access_policy) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_account_id"></a> [account\_id](#input\_account\_id) | n/a | `string` | `""` | no |
| <a name="input_allowed_idps"></a> [allowed\_idps](#input\_allowed\_idps) | n/a | `list(string)` | `[]` | no |
| <a name="input_auto_redirect_to_identity"></a> [auto\_redirect\_to\_identity](#input\_auto\_redirect\_to\_identity) | n/a | `bool` | n/a | yes |
| <a name="input_decision"></a> [decision](#input\_decision) | n/a | `string` | n/a | yes |
| <a name="input_domain"></a> [domain](#input\_domain) | n/a | `string` | n/a | yes |
| <a name="input_http_only_cookie_attribute"></a> [http\_only\_cookie\_attribute](#input\_http\_only\_cookie\_attribute) | n/a | `bool` | `false` | no |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | n/a | yes |
| <a name="input_policies"></a> [policies](#input\_policies) | n/a | `any` | n/a | yes |
| <a name="input_service_auth_401_redirect"></a> [service\_auth\_401\_redirect](#input\_service\_auth\_401\_redirect) | n/a | `bool` | `false` | no |
| <a name="input_session_duration"></a> [session\_duration](#input\_session\_duration) | n/a | `string` | n/a | yes |
| <a name="input_type"></a> [type](#input\_type) | n/a | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_access_app_id"></a> [access\_app\_id](#output\_access\_app\_id) | n/a |
<!-- END_TF_DOCS -->