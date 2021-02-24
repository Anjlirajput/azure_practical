variable "resources_name" {
  type=map(string)
  default= {
    "group_name" = "instance1_resource_group"
    "vnet_name" = "instance1_virtual_network"
    "network_interface_name"="instance1_network_interface"
    "subnet_name"="instance1_subnet"
    "public_ip_name"="instance1_public_ip"
    "linux_vm_name"="linuxvm"

  }
}

variable "location" {
  type = string
  default = "eastus"

}