#Resource Group for VMs
resource "azurerm_resource_group" "rg" {
  name     = "rg-test-sbx-eus-1"   #Change RG name here
  location = "East US"    #Change location here
 }



#Resource Group for networking (subnet & vnet)
data "azurerm_resource_group" "rg" {
  name = "rg-test-net-sbx-eus-1"   #Change network RG name here
}

data "azurerm_subnet" "subnet" {
  name                 = "snet-test-sbx-eus-1"   #Change subnet here
  virtual_network_name = "vnet-test-sbx-eus-1"   #Change vnet here
  resource_group_name  = data.azurerm_resource_group.rg.name
}



###NSG and firewall rules###
module "networking" {
  source              = "./modules/networking"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location

  subnet_id = data.azurerm_subnet.subnet.id

#Tags
  gitrepo                         = "https://gitlab.your.site/azure/sandbox/project#"
  owner                           = "Me"
  department                      = "IT"
  application_name                = "Sandbox"
  approver                        = "Me"
  cost_center                     = "TBD"
  criticality                     = "Sandbox"
  env                             = "Sbx"
  purpose                         = "Testing"
  dataclass                       = "Non-Sensitive"
}



###VM1###
module "vm1" {
  source              = "./modules/windows_vm"
  vm_name             = "ws25-01"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
# vm_size             = "Standard_E4as_v5"    #4CPU/32GB
# vm_size             = "Standard_D4as_v5"    #4CPU/16GB
  vm_size             = "Standard_B2als_v2"   #2CPU/4GB
  admin_username      = "ws25bc01_admin"
  admin_password      = "Super-S3cr3t-P@$$w0rd!"
  subnet_id = data.azurerm_subnet.subnet.id
# private_ip_address  = "10.x.x.x"   #Use Dynamic IP assigned during deployment
  zone = "1"    #Availability Zone (1,2,3)

#VM Image (OS)
  source_image_reference = {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2025-datacenter"
    version   = "latest"
  }

#Tags
  gitrepo                         = "https://gitlab.your.site/azure/sandbox/project#"
  owner                           = "Me"
  department                      = "IT"
  application_name                = "Sandbox"
  approver                        = "Me"
  cost_center                     = "TBD"
  criticality                     = "Sandbox"
  env                             = "Sbx"
  purpose                         = "Testing"
  dataclass                       = "Non-Sensitive"
}



###VM2###
module "vm2" {
  source              = "./modules/linux_vm"
  vm_name             = "alma-01"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
# vm_size             = "Standard_E4as_v5"    #4CPU/32GB
# vm_size             = "Standard_D4as_v5"    #4CPU/16GB
  vm_size             = "Standard_B2als_v2"   #2CPU/4GB
  admin_username      = "alma_admin"
  admin_password      = "Super-S3cr3t-P@$$w0rd!"
  subnet_id = data.azurerm_subnet.subnet.id
# private_ip_address  = "10.x.x.x"    #Use Dynamic IP assigned during deployment
  zone = "2"    #Availability Zone (1,2,3)

#VM Image (OS)
  source_image_reference = {
    publisher = "almalinux"
    offer     = "kitten"
    sku       = "10-x64-gen2"
    version   = "latest"
  }

#Tags
  gitrepo                         = "https://gitlab.your.site/azure/sandbox/project#"
  owner                           = "Me"
  department                      = "IT"
  application_name                = "Sandbox"
  approver                        = "Me"
  cost_center                     = "TBD"
  criticality                     = "Sandbox"
  env                             = "Sbx"
  purpose                         = "Testing"
  dataclass                       = "Non-Sensitive"
}
