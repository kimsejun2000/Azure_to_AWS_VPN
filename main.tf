provider "azurerm" {
  version   = "=1.28.0"
}

provider "aws" {
  version    = "~> 2.0"
  region     = "ap-northeast-2"
}

resource "azurerm_resource_group" "resourceGroup" {
  name      = "${local.azure_resource_group_name}"
  location  = "${local.azure_location}"
}

module "azure_virtual_network" {
  source                    = "./modules/azure_virtual_network"

  tmpname                   = "${local.name_prifix}"

  azure_location            = "${local.azure_location}"
  azure_resource_group_name = "${azurerm_resource_group.resourceGroup.name}"
}

module "azure_vpn_gateway" {
  source                    = "./modules/azure_vpn_gateway"

  tmpname                   = "${local.name_prifix}"

  azure_location            = "${local.azure_location}"
  azure_resource_group_name = "${azurerm_resource_group.resourceGroup.name}"
  azure_gateway_subnet_id   = "${module.azure_virtual_network.azure_vnet_gateway_subnet_id}"
}

module "aws_vpc" {
  source                    = "./modules/aws_vpc"

  tmpname                   = "${local.name_prifix}"

  aws_location              = "${local.aws_location}"
}

module "aws_vgw" {
  source                    = "./modules/aws_vgw"

  tmpname                   = "${local.name_prifix}"
  
  aws_location              = "${local.aws_location}"
  aws_vpc_id                = "${module.aws_vpc.aws_vpc_id}"
  aws_route_table_id        = "${module.aws_vpc.aws_vpc_default_route_table_id}"
}

module "azure_to_aws_vpn" {
  source                    = "./modules/azure_to_aws_vpn"

  tmpname                   = "${local.name_prifix}"

  azure_location            = "${local.azure_location}"
  azure_resource_group_name = "${azurerm_resource_group.resourceGroup.name}"
  azure_vnet_cidr           = "${module.azure_virtual_network.azure_vnet_cidr[0]}"
  azure_vpngw_id            = "${module.azure_vpn_gateway.azure_vpngw_id}"
  azure_vpngw_ip            = "${module.azure_vpn_gateway.azure_vpngw_ip}"

  aws_location              = "${local.aws_location}"
  aws_vpc_cidr              = "${module.aws_vpc.aws_vpc_cidr}"
  aws_vgw_id                = "${module.aws_vgw.aws_vgw_id}"
}

module "aws_ec2_amazon_instance" {
  source                    = "./modules/aws_ec2_amazon_instance"

  tmpname                   = "${local.name_prifix}"

  aws_location              = "${local.aws_location}"
  aws_vpc_id                = "${module.aws_vpc.aws_vpc_id}"
  aws_subnet_id             = "${module.aws_vpc.aws_subnet1_id}"
  aws_key_name              = "${local.aws_key_name}"
}

module "azure_ubuntu_vm" {
  source                    = "./modules/azure_ubuntu_vm"

  tmpname                   = "${local.name_prifix}"

  azure_location            = "${local.azure_location}"
  azure_resource_group_name = "${azurerm_resource_group.resourceGroup.name}"
  azure_subnet_id           = "${module.azure_virtual_network.azure_vnet_subnet_id}"
}