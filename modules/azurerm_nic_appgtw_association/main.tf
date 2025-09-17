# Associate VM NIC into the Application Gateway backend pool
resource "azurerm_network_interface_application_gateway_backend_address_pool_association" "nic_appgw_assoc" {
  network_interface_id   = data.azurerm_network_interface.nic.id
  ip_configuration_name  = "internal"  # Must match the name in the NIC's ip_configuration block
  backend_address_pool_id = tolist(data.azurerm_application_gateway.myappgtw.backend_address_pool).0.id
}





