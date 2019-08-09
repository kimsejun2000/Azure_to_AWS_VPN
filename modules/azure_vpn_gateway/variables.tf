variable "azure_location" {
  type          = "string"
  description   = "Azure location"
  default       = "koreacentral"
}

variable "tmpname" {
  type          = "string"
  description   = "Name prifix"
}

variable "azure_resource_group_name" {
  type          = "string"
  description   = "Resource group name"
}

variable "azure_vpn_sku" {
  type          = "string"
  description   = "vpn sku"
  default       = "VpnGw1"
}

variable "azure_gateway_subnet_id" {
  type          = "string"
  description   = "GatewaySubnet ID"
}

variable "azure_ptos_vpn_cidr" {
  type          = "string"
  description   = "point to site vpn cidr"
  default       = "172.16.103.0/24"
}

variable "azure_ptos_root_cert" {
  type          = "string"
  description   = "point to site vpn root public certification"
  default       = <<EOF
MIIC5zCCAc+gAwIBAgIQMt28aTr8lpVKfOn18pE1/zANBgkqhkiG9w0BAQsFADAW
MRQwEgYDVQQDDAtQMlNSb290Q2VydDAeFw0xOTA0MTYwNjAxMjBaFw0yMDA0MTYw
NjIxMjBaMBYxFDASBgNVBAMMC1AyU1Jvb3RDZXJ0MIIBIjANBgkqhkiG9w0BAQEF
AAOCAQ8AMIIBCgKCAQEA31DlgULpW0o/plu9x4LpbRA8OTs+wze+hNNSkyl5BAlP
X5iCwMhVv9PFU6VAmQm2pJWWetmE6xAbV3W3OOCEX4Q6xTP51A3t/qndRVgy7WeD
M+RP7pVNK8t3VxW1mVYb35Xe9e/XAl4Oh8E9H7yieqS2Bur+o5a87XV8837GtSkt
QdcdnMRpcyou4x70dFrjVfhzCKNbAibSM6tZQ9pp5gRbpUVqA5O89WNNOY3B1nuU
pp75LGf1KJjYfj3m0mOQ8WE7dNGViGhQ9Hslvm4ik7E+m2/iUBC2/kppk9Ylkevr
658rVvOQTu2/HLUWWi4Wi4hc/KOIlGu4pcLnPPqMDQIDAQABozEwLzAOBgNVHQ8B
Af8EBAMCAgQwHQYDVR0OBBYEFG6Z6+LgiRtVtym2EO/gjGpITsERMA0GCSqGSIb3
DQEBCwUAA4IBAQBCUq7eiBSzvep0P/MQsmRzLscJGoi0cLobxqEMpgHTaTKGmkCn
ulu+Dv3rCRrZNDAaGk98aJGt1mRkA04D4LaB+8cxrdnTePxZEpu49PbvvC9sRVjd
NlliTlyXncaWep/l/8FtLsf5VV8e8JYGnAwPfIGfD9v+1lh+HTRIbPEckWcQDsC/
RWvXVtESYQ3ZYag+nVadClKjNVhVUb6cEw2KRVDHl/LlYagp2HPNKi4K17IRwqEq
zmuBirCrLWcBCSjmqXH8V2q6BKowKEFf5ZfjJQjfSzZh7g8Udi1QLiz8fKOuSPQv
bfA4+pYcnGBphm+9OJn5IOYwu/pwtooHQgNd
EOF
}

locals {
  location              = "${var.azure_location}"
  tmpname               = "${var.tmpname}"
  resource_group_name   = "${var.azure_resource_group_name}"
  vpn_sku               = "${var.azure_vpn_sku}"
  gw_subnet_id          = "${var.azure_gateway_subnet_id}"
  p2s_cidr              = "${var.azure_ptos_vpn_cidr}"
  root_cert             = "${var.azure_ptos_root_cert}"
}