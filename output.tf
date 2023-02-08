
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
