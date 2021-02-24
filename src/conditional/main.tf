provider "azurerm" {
  version = "=2.4"
  features {}
}
variable "isdev" {
  type = bool
  default = true
}

resource "azurerm_resource_group" "resource_instance1_creation" {
  location =var.location
  name = var.resources_name.group_name
}

resource "azurerm_public_ip" "instance1_public_address" {
  allocation_method ="Dynamic"
  location = var.location
  name =var.resources_name.public_ip_name
  count = var.isdev == true ? 1 : 0
  resource_group_name =azurerm_resource_group.resource_instance1_creation.name
}

output "publicIp" {
  value = azurerm_public_ip.instance1_public_address[*].name
}




