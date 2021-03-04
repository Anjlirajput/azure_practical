

resource "azurerm_public_ip" "instance1_public_address" {
  allocation_method ="Dynamic"
  location = var.location
  name =var.resources_name.public_ip_name
  resource_group_name =azurerm_resource_group.resource_instance1_creation.name

}


resource "azurerm_network_interface" "instance1_network_interface" {
  location = var.location
  name = var.resources_name["network_interface_name"]
  resource_group_name = azurerm_resource_group.resource_instance1_creation.name
  ip_configuration {
    name = "instance1_NIC"
    subnet_id= azurerm_subnet.subnetwork_instance1.id
    private_ip_address_allocation = "dynamic"
    public_ip_address_id =azurerm_public_ip.instance1_public_address.id
  }
}


//now create a vm

resource "azurerm_linux_virtual_machine" "linuxvm" {
  admin_username = "rajput"
  location = var.location
  name = var.resources_name.linux_vm_name
  network_interface_ids = [azurerm_network_interface.instance1_network_interface.id]
  resource_group_name = var.resources_name.group_name
  size = "Standard_A1_v2"
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

   //az vm image list -p "Canonical"     for finding images

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
  //The Public Key which should be used for authentication, which needs to be at least 2048-bit
 admin_ssh_key {
   username = "rajput"
   public_key =file("~/.ssh/mykey.pub")


 }


}


output "instance1_public_ip" {
  value = azurerm_linux_virtual_machine.linuxvm.public_ip_address
}


