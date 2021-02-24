provider "azurerm" {
  version = "=2.4"
  features {}
}

resource "azurerm_resource_group" "resource_instance1_creation" {
  location =var.location
  name = var.resources_name.group_name
}

resource "azurerm_public_ip" "instance1_public_address" {
  count = 2
  allocation_method ="Dynamic"
  location = var.location
  name =var.stageIp[count.index]
  resource_group_name =azurerm_resource_group.resource_instance1_creation.name
}

output "publicIp" {
  value = azurerm_public_ip.instance1_public_address[*].name
}




