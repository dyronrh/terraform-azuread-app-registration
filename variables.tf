variable "display_name" {
  type        = string
  description = "(Required) The display name for the application.."
}

variable "api" {
  description = "(Optional) An api block as documented below, which configures API related settings for this application."
  type        = any
  default     = null
}

variable "app_role" {
  description = "(Optional) A collection of app_role blocks."
  type        = any
  default     = []
}

variable "device_only_auth_enabled" {
  description = "(Optional) Specifies whether this application supports device authentication without a user."
  type        = bool
  default     = false
}

variable "fallback_public_client_enabled" {
  description = "(Optional) Specifies whether the application is a public client. Appropriate for apps using token grant flows that don't use a redirect URI."
  type        = bool
  default     = false
}

variable "group_membership_claims" {
  description = "(Optional) Configures the groups claim issued in a user or OAuth 2.0 access token that the app expects. Possible values are `None`, `SecurityGroup`, `DirectoryRole`, `ApplicationGroup` or `All`."
  type        = list(string)
  default     = ["SecurityGroup"]
}

variable "identifier_uris" {
  description = "(Optional) A set of user-defined URI(s) that uniquely identify an application within its Azure AD tenant, or within a verified custom domain if the application is multi-tenant."
  type        = list(string)
  default     = []
}

variable "logo_image" {
  description = "(Optional)  A logo image to upload for the application, as a raw base64-encoded string. The image should be in `gif`, `jpeg` or `png` format. Note that once an image has been uploaded, it is not possible to remove it without replacing it with another image."
  type        = string
  default     = null
}

variable "marketing_url" {
  description = "(Optional) The URL to the application's home page."
  type        = string
  default     = null
}

variable "oauth2_post_response_required" {
  description = "(Optional) Specifies whether, as part of OAuth 2.0 token requests, Azure AD allows POST requests, as opposed to GET requests."
  type        = bool
  default     = false
}

variable "optional_claims" {
  description = "(Optional)  An optional claim block."
  type        = any
  default     = null
}

variable "owners" {
  description = " (Optional) A set of object IDs of principals that will be granted ownership of the application. Supported object types are users or service principals. By default, no owners are assigned."
  type        = list(string)
  default     = []
}

variable "prevent_duplicate_names" {
  description = " (Optional) If true, will return an error if an existing application is found with the same name."
  type        = bool
  default     = false
}

variable "privacy_statement_url" {
  description = "(Optional) URL of the application's privacy statement."
  type        = string
  default     = null
}

variable "public_client" {
  description = "(Optional) A public_client block as documented below, which configures non-web app or non-web API application settings, for example mobile or other public clients such as an installed application running on a desktop device."
  type        = any
  default     = null
}

variable "required_resource_access" {
  description = "(Optional) A collection of required_resource_access blocks as documented below."
  type        = any
  default     = null
}

variable "sign_in_audience" {
  description = "(Optional) The Microsoft account types that are supported for the current application. Must be one of `AzureADMyOrg`, `AzureADMultipleOrgs`, `AzureADandPersonalMicrosoftAccount` or `PersonalMicrosoftAccount`."
  type        = string
  default     = "AzureADMyOrg"
}

variable "single_page_application" {
  description = "(Optional) A single_page_application block as documented below, which configures single-page application (SPA) related settings for this application. Must be https."
  type        = any
  default     = null
}

variable "support_url" {
  description = "(Optional) URL of the application's support page.."
  type        = string
  default     = null
}

variable "tags" {
  description = "(Optional) A set of tags to apply to the application. Cannot be used together with the feature_tags block"
  type        = list(string)
  default     = []
}

variable "template_id" {
  description = "(Optional) Unique ID for a templated application in the Azure AD App Gallery, from which to create the application."
  type        = string
  default     = null
}

variable "terms_of_service_url" {
  description = "(Optional) URL of the application's terms of service statement."
  type        = string
  default     = null
}

variable "web" {
  description = "(Optional) Configures web related settings for this application."
  type        = any
  default     = null
}

variable "homepage_url" {
  description = " (Optional) Home page or landing page of the application."
  type        = string
  default     = null
}

variable "logout_url" {
  description = "(Optional) The URL that will be used by Microsoft's authorization service to sign out a user using front-channel, back-channel or SAML logout protocols."
  type        = string
  default     = null
}

variable "redirect_uris" {
  description = "(Optional) A set of URLs where user tokens are sent for sign-in, or the redirect URIs where OAuth 2.0 authorization codes and access tokens are sent. Must be a valid http URL or a URN."
  type        = string
  default     = null

}

variable "group_names" {
  description = "(Optional) Roles by groups asociations." 
  type = map(any)
  default = {}
}


variable "id_domain" {
  description = "(Required) Domain name of IT- Element"  
  type = string
  nullable = false
}

variable "sub_domain" {
  description = "(Required) Domain name of IT- Element"  
  type = string
  nullable = false
}


variable "it_element" {
  description = "(Optional) It Element value for this app"
  type = string
  default = null
}