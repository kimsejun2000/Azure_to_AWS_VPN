variable "name_prifix" {
  type          = "string"
  description   = "resource prifix"
}

variable "azure_rg_name" {
  type          = "string"
  description   = "azure resource group name"
}

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

variable "aws_key_name" {
  type          = "string"
  description   = "AWS location"
}

locals {
  name_prifix               = "${var.name_prifix}"
  azure_resource_group_name = "${var.azure_rg_name}"
  azure_location            = "${var.azure_location}"
  aws_location              = "${var.aws_location}"
  aws_key_name              = "${var.aws_key_name}"
}