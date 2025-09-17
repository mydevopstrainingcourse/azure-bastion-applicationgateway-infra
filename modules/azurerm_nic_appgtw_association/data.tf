data "azurerm_network_interface" "nic" {
  name                = var.nic_name
  resource_group_name = var.resource_group_name
}

data "azurerm_application_gateway" "myappgtw" {
  name                = var.appgtw_name
  resource_group_name = var.resource_group_name
}



