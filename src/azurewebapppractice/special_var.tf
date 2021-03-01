variable "resources_name" {
  type=map(string)
  default= {
    "group_name" = "web_app_rgp"


  }
}

variable "location" {
  type = string
  default = "eastus"

}