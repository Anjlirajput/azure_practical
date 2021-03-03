provider "azurerm" {
  version = "=2.4"
  features {}
}

resource "random_string" "random-name" {
  length  = 5
  upper   = false
  lower   = true
  number  = true
  special = false
}

resource "azurerm_resource_group" "keygroup" {
  location =var.location
  name = var.rgp_name
}

data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "keygroup" {
  location = var.location
  name ="${random_string.random-name.result}${var.key_vault_name}"
  resource_group_name = azurerm_resource_group.keygroup.name
  sku_name = "standard"
  tenant_id = data.azurerm_client_config.current.tenant_id

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = [
      "Get","List","Create","Update","Delete",
    ]

    secret_permissions = [
      "Get","List","Set","Delete",
    ]

  }

}

resource "azurerm_storage_account" "keygroup" {
  account_replication_type = "LRS"
  account_tier = "standard"
  location = var.location
  name = "${random_string.random-name.result}keystorage"
  resource_group_name = azurerm_resource_group.keygroup.name



}