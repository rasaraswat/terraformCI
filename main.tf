terraform {
  required_version = ">=1.3.7"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.43.0"
    }
  }
  cloud {
    organization = "terraformpolicies"
    workspaces {
      name = "remotestate"
    }
  }
}

provider "azurerm" {
  features {}
  skip_provider_registration = true
}

resource "azurerm_resource_group" "rg" {
  name     = "rg-terraform-practice"
  location = "Central India"
}

resource "azurerm_storage_account" "strorage" {
  name                          = "appstorageterraformci"
  account_tier                  = "Standard"
  resource_group_name           = azurerm_resource_group.rg.name
  location                      = azurerm_resource_group.rg.location
  account_replication_type      = "LRS"
  public_network_access_enabled = false
}
