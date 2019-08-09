output "azure_vnet_id" {
  value = "${azurerm_virtual_network.VirtualNetwork.id}"
}

output "azure_vnet_name" {
  value = "${azurerm_virtual_network.VirtualNetwork.name}"
}

output "azure_vnet_cidr" {
  value = "${azurerm_virtual_network.VirtualNetwork.address_space}"
}

output "azure_vnet_subnet_id" {
  value = "${azurerm_subnet.Subnet01.id}"
}

output "azure_vnet_subnet_cidr" {
  value = "${azurerm_subnet.Subnet01.address_prefix}"
}

output "azure_vnet_gateway_subnet_id" {
  value = "${azurerm_subnet.gatewaySubnet.id}"
}

output "azure_vnet_gateway_subnet_cidr" {
  value = "${azurerm_subnet.gatewaySubnet.address_prefix}"
}