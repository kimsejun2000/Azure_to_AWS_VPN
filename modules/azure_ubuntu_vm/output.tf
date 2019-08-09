output "azure_vm_id" {
  value = "${azurerm_virtual_machine.AzurevirtualMachine.id}"
}

output "azure_vm_name" {
  value = "${local.tmpname}-client1"
}

output "azure_vm_public_ip_id" {
  value = "${azurerm_public_ip.virtualMachine-Publicip.id}"
}

output "azure_vm_public_ip_name" {
  value = "${local.tmpname}-VM-pip"
}

output "azure_vm_public_ip_address" {
  value = "${azurerm_public_ip.virtualMachine-Publicip.ip_address}"
}

output "azure_vm_private_ip_address" {
  value = "${azurerm_network_interface.virtualNetworkInterface.private_ip_address}"
}