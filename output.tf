output "azure_app" {
  description = "Full data from app registered on azure ad"
  value = azuread_application.main
}