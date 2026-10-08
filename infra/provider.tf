terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  alias           = "c1"
  client_id       = "<AZURE_CLIENT_ID_C1>"
  client_secret   = "<AZURE_CLIENT_SECRET_C1>"
  tenant_id       = "<AZURE_TENANT_ID_C1>"
  subscription_id = "<AZURE_SUBSCRIPTION_ID_C1>"
  features {}
}

provider "azurerm" {
  alias           = "c2"
  client_id       = "<AZURE_CLIENT_ID_C2>"
  client_secret   = "<AZURE_CLIENT_SECRET_C2>"
  tenant_id       = "<AZURE_TENANT_ID_C2>"
  subscription_id = "<AZURE_SUBSCRIPTION_ID_C2>"
  features {}
}