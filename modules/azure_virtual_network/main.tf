provider "azurerm" {
  version   = "=1.28.0"
}

resource "azurerm_virtual_network" "VirtualNetwork" {
  name                = "${local.tmpname}-vNet"
  location            = "${local.location}"
  resource_group_name = "${local.resource_group_name}"
  address_space       = ["${local.vnet_cidr}"]
}

resource "azurerm_subnet" "Subnet01" {
  name                 = "${local.tmpname}-Subnet01"
  resource_group_name  = "${local.resource_group_name}"
  virtual_network_name = "${azurerm_virtual_network.VirtualNetwork.name}"
  address_prefix       = "${local.subnet_cidr}"
}
resource "azurerm_subnet" "gatewaySubnet" {
  name                 = "GatewaySubnet"
  resource_group_name  = "${local.resource_group_name}"
  virtual_network_name = "${azurerm_virtual_network.VirtualNetwork.name}"
  address_prefix       = "${local.gw_subnet_cidr}"
}