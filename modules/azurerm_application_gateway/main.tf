resource "azurerm_application_gateway" "my-app-gateway" {
  name                = var.appgtw_name
  resource_group_name = var.resource_group_name
  location            = var.appgtw_location

  sku {
    name     = "Standard_v2"
    tier     = "Standard_v2"
    capacity = 2
  }

  gateway_ip_configuration {
    name      = "my-gateway-ip-configuration"
    subnet_id = data.azurerm_subnet.my-data-subnet.id
  }

  frontend_port {
    name = "ankit-frontendport-apgtw"
    port = 80
  }

  frontend_ip_configuration {
    name                 = "ankit-ipconfig-apgtw"
    public_ip_address_id = data.azurerm_public_ip.my-data-pip.id
  }

  backend_address_pool {
    name = "my-backend-settings"
  }

  backend_http_settings {
    name                  = "my-backend-http-settings"
    cookie_based_affinity = "Disabled"    
    port                  = 80
    protocol              = "Http"
    request_timeout       = 20
  }

  http_listener {
    name                           = "ankit-listener"
    frontend_ip_configuration_name = "ankit-ipconfig-apgtw"
    frontend_port_name             = "ankit-frontendport-apgtw"
    protocol                       = "Http"
  }

  request_routing_rule {
    name                       = "my-request-routing-name"
    priority                   = 100
    rule_type                  = "Basic"
    http_listener_name         = "ankit-listener"
    backend_address_pool_name  = "my-backend-settings"
    backend_http_settings_name = "my-backend-http-settings"
  }
}