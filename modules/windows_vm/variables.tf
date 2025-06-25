variable "vm_name" { default = "ws25-01" }
variable "location" { default = "East US" }
variable "resource_group_name" { default = "rg-test-use-01" }
variable "vm_size" { default = "Standard_B2ms" }
variable "admin_username" { default = "admin" }
variable "admin_password" { default = "P@$$w0rd1234!" }

variable "subnet_id" {
  description = "snet-test-dev-use-1"
  type        = string
}

variable "private_ip_address" {
  type        = string
  default     = null
  description = "Optional static private IP address for the VM"
}

variable "zone" {
  type    = string
  default = "1"
  description = "The Availability Zone to place the VM in (1, 2, or 3)"
}

variable "source_image_reference" {
  description = "The source image reference for the virtual machine"
  type = object({
    publisher = string
    offer     = string
    sku       = string
    version   = string
  })
}


##Tags
variable "gitrepo" {
  description = "Gitlab repo"
}
variable "owner" {
  description = "Owner"
}
variable "department" {
  description = "Department"
}
variable "application_name" {
  description = "Application name"
}
variable "approver" {
  description = "Who approves the resources"
}
variable "cost_center" {
  description = "Cost code for payer"
}
variable "criticality" {
  description = "Criticality"
}
variable "env" {
  description = "Environment, Prod, Dev, Test, Staging"
}
variable "purpose" {
  description = "What is the purpose of this"
}
variable "dataclass" {
  description = "Highly Sensitive, Restricted, Internal,Public"
}
