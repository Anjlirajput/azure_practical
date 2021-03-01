provider "azurerm" {
  version = "=2.4"
  features {}
}

resource "azurerm_resource_group" "web_app_rgp" {
  location =var.location
  name = var.resources_name.group_name
}

