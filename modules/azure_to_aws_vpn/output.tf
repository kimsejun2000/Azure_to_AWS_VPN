output "azure_lgw01_id" {
  value = "${azurerm_local_network_gateway.AWSLocalNetworkGateway01.id}"
}

output "azure_lgw01_name" {
  value = "${local.tmpname}-AWS-VPN01"
}

output "azure_lgw02_id" {
  value = "${azurerm_local_network_gateway.AWSLocalNetworkGateway02.id}"
}

output "azure_lgw02_name" {
  value = "${local.tmpname}-AWS-VPN02"
}

output "aws_cgw_id" {
  value = "${aws_customer_gateway.AuzreCustomerGateway.id}"
}

output "aws_vpnconnection_id" {
  value = "${aws_vpn_connection.VPNConnection.id}"
}

output "aws_vpnconnection_tunnel1_address" {
  value = "${aws_vpn_connection.VPNConnection.tunnel1_address}"
}

output "aws_vpnconnection_tunnel1_preshared_key" {
  value = "${aws_vpn_connection.VPNConnection.tunnel1_preshared_key}"
}

output "aws_vpnconnection_tunnel2_address" {
  value = "${aws_vpn_connection.VPNConnection.tunnel2_address}"
}

output "aws_vpnconnection_tunnel2_preshared_key" {
  value = "${aws_vpn_connection.VPNConnection.tunnel2_preshared_key}"
}