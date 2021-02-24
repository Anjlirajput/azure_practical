variable "resources_name" {
  type=map(string)
  default= {
    "group_name" = "instance1_resource_group"
    "public_ip_name"="instance1_public_ip"


  }
}

variable "location" {
  type = string
  default = "eastus"

}

