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

variable "azure_subnet_id" {
  type          = "string"
  description   = "Subnet ID"
}

variable "azure_virtual_machine_size" {
  type          = "string"
  description   = "virtual machine size"
  default       = "Standard_B1ls"
}

variable "azure_vmadmin_account" {
  type          = "string"
  description   = "Subnet ID"
  default       = "vmadmin"
}

variable "azure_vmadmin_password" {
  type          = "string"
  description   = "Subnet ID"
  default       = "Pa55w.rd1234"
}

variable "azure_managed_disk_redundancy" {
  type          = "string"
  description   = "virtual machine disk redundancy"
  default       = "Standard_LRS"
}

locals {
  location              = "${var.azure_location}"
  tmpname               = "${var.tmpname}"
  resource_group_name   = "${var.azure_resource_group_name}"
  subnet_id             = "${var.azure_subnet_id}"
  vm_size               = "${var.azure_virtual_machine_size}"
  disk_redundancy       = "${var.azure_managed_disk_redundancy}"
  admin                 = "${var.azure_vmadmin_account}"
  password              = "${var.azure_vmadmin_password}"
}