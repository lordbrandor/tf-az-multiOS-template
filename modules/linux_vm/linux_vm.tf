resource "azurerm_network_interface" "vm_nic" {
  name                = "${var.vm_name}-nic"
  location            = var.location
  resource_group_name = var.resource_group_name
  tags = local.tags


  ip_configuration {
      name                          = "internal"
      subnet_id                     = var.subnet_id
      private_ip_address_allocation = var.private_ip_address != null ? "Static" : "Dynamic"
      private_ip_address            = var.private_ip_address
    }
}

resource "azurerm_linux_virtual_machine" "vm" {
  name                = var.vm_name
  resource_group_name = var.resource_group_name
  location            = var.location
  size                = var.vm_size
  admin_username      = var.admin_username
  admin_password      = var.admin_password
# encryption_at_host_enabled = true   #Hardware level encryption at Azure host
  network_interface_ids = [azurerm_network_interface.vm_nic.id]
  zone = var.zone
  disable_password_authentication = "false"
  tags = local.tags
  computer_name = var.vm_name
  
  os_disk {
    name                 = "${var.vm_name}-OS-disk"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"       #Standard=HDD, Premium=SSD
  }

  source_image_reference {
    publisher = var.source_image_reference.publisher
    offer     = var.source_image_reference.offer
    sku       = var.source_image_reference.sku
    version   = var.source_image_reference.version
  }
  
  identity {
    type = "SystemAssigned"
  }

}

#Create 20GB data disk
# resource "azurerm_managed_disk" "dd01" {
#   name                 = "${var.vm_name}-Data-disk"
#   location             = var.location
#   resource_group_name  = var.resource_group_name
#   storage_account_type = "Standard_LRS"
#   create_option        = "Empty"
#   disk_size_gb         = 20
#   zone = var.zone
# }
# 
# #Attach data disk
# resource "azurerm_virtual_machine_data_disk_attachment" "data_disk_attach" {
#   managed_disk_id    = azurerm_managed_disk.dd01.id
#   virtual_machine_id = azurerm_linux_virtual_machine.vm.id
#   lun                = 0
#   caching            = "None"
# }

