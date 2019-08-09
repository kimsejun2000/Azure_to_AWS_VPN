provider "azurerm" {
  version   = "=1.28.0"
}

provider "aws" {
  version    = "~> 2.0"
  region     = "${local.aws_location}"
}

resource "aws_customer_gateway" "AuzreCustomerGateway" {
  bgp_asn    = 65000
  ip_address = "${local.azure_vpngw_ip_address}"
  type       = "ipsec.1"

  tags = {
    Name = "${local.tmpname}-VPNGW"
  }
}

resource "aws_vpn_connection" "VPNConnection" {
  vpn_gateway_id        = "${local.aws_vgw_id}"
  customer_gateway_id   = "${aws_customer_gateway.AuzreCustomerGateway.id}"
  type                  = "ipsec.1"
  static_routes_only    = true

  tags = {
    Name = "${local.tmpname}-VPN"
  }
}

resource "aws_vpn_connection_route" "AWS-to-Azure-route" {
  destination_cidr_block = "${local.azure_vnet_cidr}"
  vpn_connection_id      = "${aws_vpn_connection.VPNConnection.id}"
}

resource "azurerm_local_network_gateway" "AWSLocalNetworkGateway01" {
  name                = "${local.tmpname}-AWS-VPN01"
  location            = "${local.azure_location}"
  resource_group_name = "${local.azure_resource_group_name}"
  gateway_address     = "${aws_vpn_connection.VPNConnection.tunnel1_address}"
  address_space       = ["${local.aws_vpc_cidr}"]
}

resource "azurerm_local_network_gateway" "AWSLocalNetworkGateway02" {
  name                = "${local.tmpname}-AWS-VPN02"
  location            = "${local.azure_location}"
  resource_group_name = "${local.azure_resource_group_name}"
  gateway_address     = "${aws_vpn_connection.VPNConnection.tunnel2_address}"
  address_space       = ["${local.aws_vpc_cidr}"]
}

resource "azurerm_virtual_network_gateway_connection" "Azure-to-AWS-VPN01" {
  name                       = "${local.tmpname}-Azure-to-AWS-VPN01"
  location                   = "${local.azure_location}"
  resource_group_name        = "${local.azure_resource_group_name}"

  type                       = "IPsec"
  virtual_network_gateway_id = "${local.auzre_vpngw_id}"
  local_network_gateway_id   = "${azurerm_local_network_gateway.AWSLocalNetworkGateway01.id}"

  shared_key                 = "${aws_vpn_connection.VPNConnection.tunnel1_preshared_key}"
}

resource "azurerm_virtual_network_gateway_connection" "Azure-to-AWS-VPN02" {
  name                       = "${local.tmpname}-Azure-to-AWS-VPN02"
  location                   = "${local.azure_location}"
  resource_group_name        = "${local.azure_resource_group_name}"

  type                       = "IPsec"
  virtual_network_gateway_id = "${local.auzre_vpngw_id}"
  local_network_gateway_id   = "${azurerm_local_network_gateway.AWSLocalNetworkGateway02.id}"

  shared_key                 = "${aws_vpn_connection.VPNConnection.tunnel2_preshared_key}"
}