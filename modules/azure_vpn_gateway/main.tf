provider "azurerm" {
  version   = "=1.28.0"
}

resource "azurerm_public_ip" "virtualGateway-Publicip" {
  name                = "${local.tmpname}-VGW-pip"
  location            = "${local.location}"
  resource_group_name = "${local.resource_group_name}"

  allocation_method   = "Dynamic"
}

resource "azurerm_virtual_network_gateway" "virtualGateway" {
  name                = "${local.tmpname}-VGW"
  location            = "${local.location}"
  resource_group_name = "${local.resource_group_name}"

  type                = "Vpn"
  vpn_type            = "RouteBased"

  active_active       = false
  enable_bgp          = false
  sku                 = "${local.vpn_sku}"

  ip_configuration {
    name                          = "vnetGatewayConfig"
    public_ip_address_id          = "${azurerm_public_ip.virtualGateway-Publicip.id}"
    private_ip_address_allocation = "Dynamic"
    subnet_id                     = "${local.gw_subnet_id}"
  }

  vpn_client_configuration {
    address_space        = ["${local.p2s_cidr}"]
    vpn_client_protocols = ["IkeV2","OpenVPN"]
    root_certificate {
      name             = "root"
      public_cert_data = "${local.root_cert}"
    }
  }
}