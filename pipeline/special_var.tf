variable "resources_name" {
  type=map(string)
  default= {
    "group_name" = "instance_resource_group"
    "vnet_name" = "instance_virtual_network"
    "network_interface_name"="instance_network_interface"
    "subnet_name"="instance_subnet"
    "public_ip_name"="instance_public_ip"
    "linux_vm_name"="linuxvm"

  }
}

variable "location" {
  type = string
  default = "eastus"

}