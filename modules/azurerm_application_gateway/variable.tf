variable "virtual_network_name" {
  description = "The name of the virtual network"
  type = string
}
variable "subnet_name" {
  description = "The name of the subnet"
  type = string  
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type = string
}
variable "appgtw_name" {
  description = "The name of the application gateway"
  type = string  
}
variable "appgtw_location" {
  description = "The location of the application gateway"
  type = string  
}
variable "appgtw_public_ip" {
  description = "The public ip of the application gateway"
  type = string  
}