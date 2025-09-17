data "azurerm_public_ip" "my-data-pip" {
  name                = var.appgtw_public_ip
  resource_group_name = var.resource_group_name
}

data "azurerm_subnet" "my-data-subnet" {
  name                 = var.subnet_name
  virtual_network_name = var.virtual_network_name
  resource_group_name  = var.resource_group_name
}