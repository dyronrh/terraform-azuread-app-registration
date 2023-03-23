
output "object_id" {
  description = "The application's object ID."
  value       = azuread_application.main.object_id
}

output "tenant_id" {
  value = data.azuread_client_config.current.tenant_id
}


output "client_id" {
  value = data.azuread_client_config.current.client_id
}


output "azure_redirect_uri_spa" {
  description = "The application's redirect redirect_uris for spa."
  value = length(azuread_application.main.single_page_application.*.redirect_uris) > 0 ? azuread_application.main.single_page_application.*.redirect_uris : null
}


output "azure_redirect_uri_web" {
  description = "The application's redirect redirect_uris for web."
  value = length(azuread_application.main.web.*.redirect_uris) > 0 ? azuread_application.main.web.*.redirect_uris : null
}


output "azure_redirect_uri_public_client" {
  description = "The application's redirect redirect_uris for public_client."
  value = length(azuread_application.main.public_client.*.redirect_uris)  > 0 ? azuread_application.main.public_client.*.redirect_uris : null
}

