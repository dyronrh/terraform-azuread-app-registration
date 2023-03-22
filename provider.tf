terraform {
  required_providers {
    azuread = {
      source  = "hashicorp/azuread"
      version = ">= 2.33.0"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.42.0"
    }
    random = {
      source  = "hashicorp/random"
      version = ">= 3.4.3"
    }
  }
  required_version = ">= 0.13"
}
