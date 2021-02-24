provider "azurerm" {
  version = "=2.4"
  features {}
}

resource "azurerm_resource_group" "resource_instance1_creation" {
  location =var.location
  name = var.resources_name.group_name

}

resource "azurerm_virtual_network" "virtual_network_instance1" {
  address_space =  ["10.0.0.0/16"]
  location = var.location
  name = var.resources_name.vnet_name
  resource_group_name =azurerm_resource_group.resource_instance1_creation.name
}
resource "azurerm_subnet" "subnetwork_instance1" {
  name                 = var.resources_name.subnet_name
  resource_group_name  = azurerm_resource_group.resource_instance1_creation.name
  virtual_network_name = azurerm_virtual_network.virtual_network_instance1.name
  address_prefix       = "10.0.0.0/24"


}


resource "azurerm_network_security_group" "security_rules" {
  name                = "instance1_security_rules"
  location            = var.location
  resource_group_name =azurerm_resource_group.resource_instance1_creation.name

  security_rule {
    name                       = "SSH"
    priority                   = 1001
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
  security_rule {
    name                       = "HTTP"
    priority                   = 1002
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }



}



//
//resource "azurerm_subnet_network_security_group_association" "instance1_nsg_association" {
//  subnet_id                 = azurerm_subnet.subnetwork_instance1.id
//  network_security_group_id = azurerm_network_security_group.allow-ssh.id
//}