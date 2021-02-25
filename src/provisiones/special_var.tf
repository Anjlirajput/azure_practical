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

variable "username" {
  type = string
  default = "rajput"
}
# error executing "/tmp/terraform_532061438.sh": wait: remote command exited without exit status or exit signal