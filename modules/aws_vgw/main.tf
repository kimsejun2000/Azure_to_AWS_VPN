provider "aws" {
  version    = "~> 2.0"
  region     = "${local.location}"
}

resource "aws_vpn_gateway" "VPNGateway" {
  vpc_id = "${local.vpc_id}"

  tags = {
    Name = "${local.tmpname}-VPNGW"
  }
}

resource "aws_vpn_gateway_attachment" "attachmentVPNGateway" {
  vpc_id         = "${local.vpc_id}"
  vpn_gateway_id = "${aws_vpn_gateway.VPNGateway.id}"
}

resource "aws_vpn_gateway_route_propagation" "VPNGateway-route-propagation" {
  vpn_gateway_id = "${aws_vpn_gateway.VPNGateway.id}"
  route_table_id = "${local.rt_id}"
}