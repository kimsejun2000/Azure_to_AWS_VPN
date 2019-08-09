provider "azurerm" {
  version   = "=1.28.0"
}

resource "azurerm_public_ip" "virtualMachine-Publicip" {
  name                = "${local.tmpname}-VM-pip"
  location            = "${local.location}"
  resource_group_name = "${local.resource_group_name}"

  allocation_method   = "Dynamic"
}

resource "azurerm_network_interface" "virtualNetworkInterface" {
  name                  = "${local.tmpname}-nic"
  location              = "${local.location}"
  resource_group_name   = "${local.resource_group_name}"

  ip_configuration {
    name                          = "testconfiguration1"
    subnet_id                     = "${local.subnet_id}"
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id  = "${azurerm_public_ip.virtualMachine-Publicip.id}"
  }
}

resource "azurerm_virtual_machine" "AzurevirtualMachine" {
  name                  = "${local.tmpname}-client1"
  location              = "${local.location}"
  resource_group_name   = "${local.resource_group_name}"
  network_interface_ids = ["${azurerm_network_interface.virtualNetworkInterface.id}"]
  vm_size               = "${local.vm_size}"

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
  
  storage_os_disk {
    name              = "${local.tmpname}-osdisk1"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "${local.disk_redundancy}"
  }

  os_profile {
    computer_name  = "${local.tmpname}-client1"
    admin_username = "${local.admin}"
    admin_password = "${local.password}"
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }
}