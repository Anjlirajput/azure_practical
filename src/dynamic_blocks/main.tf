provider "azurerm" {
  version = "=2.4"
  features {}
}



resource "azurerm_resource_group" "resource_instance1_creation" {
  location =var.location
  name = var.resources_name.group_name
}

resource "azurerm_network_security_group" "security_rules" {
  name = "instance1_security_rules"
  location = var.location
  resource_group_name = azurerm_resource_group.resource_instance1_creation.name
  dynamic security_rule {
    for_each = var.portlist
    iterator = port
    content {
      name = var.portname[port.key]
      priority = var.priority[port.key]
      direction = "Inbound"
      access = "Allow"
      protocol = "Tcp"
      source_port_range = "*"
      destination_port_range = port.value
      source_address_prefix = "*"
      destination_address_prefix = "*"

    }
  }

}




