variable "resources_name" {
  type=map(string)
  default= {
    "group_name" = "instance1_resource_group"
  }
}

variable "location" {
  type = string
  default = "eastus"

}

variable "portlist" {
  type = list(string)
  default = [22,80,8080,3036]
}
variable "portname" {
  type = list(string)
  default = ["SSH","Localhost","webserver","database"]
}
variable "priority" {
  type = list(number)
  default = [1001,1002,1000,1003]
}
