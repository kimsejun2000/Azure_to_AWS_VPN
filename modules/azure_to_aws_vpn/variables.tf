variable "azure_location" {
  type          = "string"
  description   = "Azure location"
  default       = "koreacentral"
}

variable "aws_location" {
  type          = "string"
  description   = "AWS location"
  default       = "ap-northeast-2"
}

variable "tmpname" {
  type          = "string"
  description   = "Name prifix"
}

variable "azure_resource_group_name" {
  type          = "string"
  description   = "Resource group name"
}

variable "azure_vnet_cidr" {
  type          = "string"
  description   = "Azure virtual network cidr"
}

variable "azure_vpngw_id" {
  type          = "string"
  description   = "Azure virtual network gateway id"
}

variable "azure_vpngw_ip" {
  type          = "string"
  description   = "Azure virtual network gateway ip"
}

variable "aws_vpc_cidr" {
  type          = "string"
  description   = "AWS VPC cidr"
}

variable "aws_vgw_id" {
  type          = "string"
  description   = "AWS virtual gateway id"
}

locals {
  azure_location              = "${var.azure_location}"
  tmpname                     = "${var.tmpname}"
  azure_resource_group_name   = "${var.azure_resource_group_name}"
  azure_vnet_cidr             = "${var.azure_vnet_cidr}"
  azure_vpngw_ip_address      = "${var.azure_vpngw_ip}"
  auzre_vpngw_id              = "${var.azure_vpngw_id}"
  aws_location                = "${var.aws_location}"
  aws_vpc_cidr                = "${var.aws_vpc_cidr}"
  aws_vgw_id                  = "${var.aws_vgw_id}"
}