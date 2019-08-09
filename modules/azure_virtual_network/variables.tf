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

variable "azure_vnet_cidr" {
  type          = "string"
  description   = "Subnet ID"
  default       = "10.0.0.0/16"
}

variable "azure_subnet_cidr" {
  type          = "string"
  description   = "virtual machine size"
  default       = "10.0.0.0/24"
}

variable "azure_gateway_subnet_cidr" {
  type          = "string"
  description   = "Subnet ID"
  default       = "10.0.254.0/24"
}

locals {
  location              = "${var.azure_location}"
  tmpname               = "${var.tmpname}"
  resource_group_name   = "${var.azure_resource_group_name}"
  vnet_cidr             = "${var.azure_vnet_cidr}"
  subnet_cidr           = "${var.azure_subnet_cidr}"
  gw_subnet_cidr        = "${var.azure_gateway_subnet_cidr}"
}