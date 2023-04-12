## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13 |
| <a name="requirement_azuread"></a> [azuread](#requirement\_azuread) | >= 2.33.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >= 3.42.0 |
| <a name="requirement_random"></a> [random](#requirement\_random) | >= 3.4.3 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azuread"></a> [azuread](#provider\_azuread) | >= 2.33.0 |
| <a name="provider_random"></a> [random](#provider\_random) | >= 3.4.3 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azuread_app_role_assignment.example](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/resources/app_role_assignment) | resource |
| [azuread_application.main](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/resources/application) | resource |
| [azuread_service_principal.internal](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/resources/service_principal) | resource |
| [random_uuid.random_role_id](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/uuid) | resource |
| [azuread_client_config.current](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/data-sources/client_config) | data source |
| [azuread_group.main](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/data-sources/group) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_api"></a> [api](#input\_api) | (Optional) An api block as documented below, which configures API related settings for this application. | `any` | `null` | no |
| <a name="input_app_role"></a> [app\_role](#input\_app\_role) | (Optional) A collection of app\_role blocks. | `any` | `[]` | no |
| <a name="input_device_only_auth_enabled"></a> [device\_only\_auth\_enabled](#input\_device\_only\_auth\_enabled) | (Optional) Specifies whether this application supports device authentication without a user. | `bool` | `false` | no |
| <a name="input_display_name"></a> [display\_name](#input\_display\_name) | (Required) The display name for the application.. | `string` | n/a | yes |
| <a name="input_fallback_public_client_enabled"></a> [fallback\_public\_client\_enabled](#input\_fallback\_public\_client\_enabled) | (Optional) Specifies whether the application is a public client. Appropriate for apps using token grant flows that don't use a redirect URI. | `bool` | `false` | no |
| <a name="input_group_membership_claims"></a> [group\_membership\_claims](#input\_group\_membership\_claims) | (Optional) Configures the groups claim issued in a user or OAuth 2.0 access token that the app expects. Possible values are `None`, `SecurityGroup`, `DirectoryRole`, `ApplicationGroup` or `All`. | `list(string)` | <pre>[<br>  "SecurityGroup"<br>]</pre> | no |
| <a name="input_group_names"></a> [group\_names](#input\_group\_names) | n/a | `map(any)` | `{}` | no |
| <a name="input_homepage_url"></a> [homepage\_url](#input\_homepage\_url) | (Optional) Home page or landing page of the application. | `string` | `null` | no |
| <a name="input_iam-user-policy-map"></a> [iam-user-policy-map](#input\_iam-user-policy-map) | n/a | `map(any)` | <pre>{<br>  "POC_USER_ROLES_1": [<br>    "Reader_poc",<br>    "Reader_poc1",<br>    "Reader_poc2"<br>  ],<br>  "POC_USER_ROLES_2": [<br>    "Reader_poc4",<br>    "Reader_poc6",<br>    "Reader_poc7"<br>  ]<br>}</pre> | no |
| <a name="input_identifier_uris"></a> [identifier\_uris](#input\_identifier\_uris) | (Optional) A set of user-defined URI(s) that uniquely identify an application within its Azure AD tenant, or within a verified custom domain if the application is multi-tenant. | `list(string)` | `[]` | no |
| <a name="input_logo_image"></a> [logo\_image](#input\_logo\_image) | (Optional)  A logo image to upload for the application, as a raw base64-encoded string. The image should be in `gif`, `jpeg` or `png` format. Note that once an image has been uploaded, it is not possible to remove it without replacing it with another image. | `string` | `null` | no |
| <a name="input_logout_url"></a> [logout\_url](#input\_logout\_url) | (Optional) The URL that will be used by Microsoft's authorization service to sign out a user using front-channel, back-channel or SAML logout protocols. | `string` | `null` | no |
| <a name="input_marketing_url"></a> [marketing\_url](#input\_marketing\_url) | (Optional) The URL to the application's home page. | `string` | `null` | no |
| <a name="input_oauth2_post_response_required"></a> [oauth2\_post\_response\_required](#input\_oauth2\_post\_response\_required) | (Optional) Specifies whether, as part of OAuth 2.0 token requests, Azure AD allows POST requests, as opposed to GET requests. | `bool` | `false` | no |
| <a name="input_optional_claims"></a> [optional\_claims](#input\_optional\_claims) | (Optional)  An optional claim block. | `any` | `null` | no |
| <a name="input_owners"></a> [owners](#input\_owners) | (Optional) A set of object IDs of principals that will be granted ownership of the application. Supported object types are users or service principals. By default, no owners are assigned. | `list(string)` | `[]` | no |
| <a name="input_prevent_duplicate_names"></a> [prevent\_duplicate\_names](#input\_prevent\_duplicate\_names) | (Optional) If true, will return an error if an existing application is found with the same name. | `bool` | `false` | no |
| <a name="input_privacy_statement_url"></a> [privacy\_statement\_url](#input\_privacy\_statement\_url) | (Optional) URL of the application's privacy statement. | `string` | `null` | no |
| <a name="input_public_client"></a> [public\_client](#input\_public\_client) | (Optional) A public\_client block as documented below, which configures non-web app or non-web API application settings, for example mobile or other public clients such as an installed application running on a desktop device. | `any` | `null` | no |
| <a name="input_redirect_uris"></a> [redirect\_uris](#input\_redirect\_uris) | (Optional) A set of URLs where user tokens are sent for sign-in, or the redirect URIs where OAuth 2.0 authorization codes and access tokens are sent. Must be a valid http URL or a URN. | `string` | `null` | no |
| <a name="input_required_resource_access"></a> [required\_resource\_access](#input\_required\_resource\_access) | (Optional) A collection of required\_resource\_access blocks as documented below. | `any` | `null` | no |
| <a name="input_sign_in_audience"></a> [sign\_in\_audience](#input\_sign\_in\_audience) | (Optional) The Microsoft account types that are supported for the current application. Must be one of `AzureADMyOrg`, `AzureADMultipleOrgs`, `AzureADandPersonalMicrosoftAccount` or `PersonalMicrosoftAccount`. | `string` | `"AzureADMyOrg"` | no |
| <a name="input_single_page_application"></a> [single\_page\_application](#input\_single\_page\_application) | (Optional) A single\_page\_application block as documented below, which configures single-page application (SPA) related settings for this application. Must be https. | `any` | `null` | no |
| <a name="input_support_url"></a> [support\_url](#input\_support\_url) | (Optional) URL of the application's support page.. | `string` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | (Optional) A set of tags to apply to the application. Cannot be used together with the feature\_tags block | `list(string)` | `[]` | no |
| <a name="input_template_id"></a> [template\_id](#input\_template\_id) | (Optional) Unique ID for a templated application in the Azure AD App Gallery, from which to create the application. | `string` | `null` | no |
| <a name="input_terms_of_service_url"></a> [terms\_of\_service\_url](#input\_terms\_of\_service\_url) | (Optional) URL of the application's terms of service statement. | `string` | `null` | no |
| <a name="input_web"></a> [web](#input\_web) | (Optional) Configures web related settings for this application. | `any` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_all_groupos"></a> [all\_groupos](#output\_all\_groupos) | n/a |
| <a name="output_all_resource_ids"></a> [all\_resource\_ids](#output\_all\_resource\_ids) | n/a |
| <a name="output_all_rgroups"></a> [all\_rgroups](#output\_all\_rgroups) | n/a |
| <a name="output_azure_app_roles"></a> [azure\_app\_roles](#output\_azure\_app\_roles) | n/a |
| <a name="output_azure_redirect_uri_public_client"></a> [azure\_redirect\_uri\_public\_client](#output\_azure\_redirect\_uri\_public\_client) | The application's redirect redirect\_uris for public\_client. |
| <a name="output_azure_redirect_uri_spa"></a> [azure\_redirect\_uri\_spa](#output\_azure\_redirect\_uri\_spa) | The application's redirect redirect\_uris for spa. |
| <a name="output_azure_redirect_uri_web"></a> [azure\_redirect\_uri\_web](#output\_azure\_redirect\_uri\_web) | The application's redirect redirect\_uris for web. |
| <a name="output_azure_roles_group"></a> [azure\_roles\_group](#output\_azure\_roles\_group) | The application's roles in groups. |
| <a name="output_client_id"></a> [client\_id](#output\_client\_id) | n/a |
| <a name="output_groups-roles-map"></a> [groups-roles-map](#output\_groups-roles-map) | n/a |
| <a name="output_object_id"></a> [object\_id](#output\_object\_id) | The application's object ID. |
| <a name="output_tenant_id"></a> [tenant\_id](#output\_tenant\_id) | n/a |
