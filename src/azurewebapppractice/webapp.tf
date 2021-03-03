resource "random_string" "random-name" {
  length  = 5
  upper   = false
  lower   = true
  number  = true
  special = false
}


resource "azurerm_app_service_plan" "app-service-plan" {
  name = "app-service-plan"
  location = azurerm_resource_group.web_app_rgp.location
  resource_group_name = azurerm_resource_group.web_app_rgp.name
  kind = "Linux"
  reserved = true
  sku {
    tier = "Standard"
    size = "S1"
  }

}

resource "azurerm_app_service" "example" {
  name                = "myapp${random_string.random-name.result}"
  location            = azurerm_resource_group.web_app_rgp.location
  resource_group_name = azurerm_resource_group.web_app_rgp.name
  app_service_plan_id = azurerm_app_service_plan.app-service-plan.id




  site_config {
//    linux_fx_version = "JAVA|11"
//    always_on        = true
    linux_fx_version       = "TOMCAT|9.0-java11"
    always_on              = true
    ftps_state             = "AllAllowed"



  }





}

