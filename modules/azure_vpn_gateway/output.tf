output "azure_vpngw_id" {
  value = "${azurerm_virtual_network_gateway.virtualGateway.id}"
}

output "azure_vpngw_name" {
  value = "${local.tmpname}-VGW"
}

output "azure_vpngw_ip" {
  value = "${azurerm_public_ip.virtualGateway-Publicip.ip_address}"
}