terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

# Les identifiants ne sont plus dans le code : le provider azurerm lit
# ARM_CLIENT_ID, ARM_CLIENT_SECRET, ARM_TENANT_ID et ARM_SUBSCRIPTION_ID dans l'environnement.
# Les anciens secrets commites sont consideres compromis : voir RAPPORT.md, plan de revocation.
provider "azurerm" {
  alias = "c1"
  features {}
}

# Second abonnement : exporter les variables ARM_* du second principal de service
# dans un shell dedie avant d'appliquer la configuration qui l'utilise.
provider "azurerm" {
  alias = "c2"
  features {}
}
