
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

output "single_spa_redirect_uris" {
  description = "The application's redirect redirect_uris."
  value = azuread_application.main.single_page_application[0].redirect_uris != null ? azuread_application.main.single_page_application[0].redirect_uris : null
}