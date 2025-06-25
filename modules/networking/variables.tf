variable "location" { default = "East US" }
variable "resource_group_name" { default = "rg-test-use-01" }

variable "subnet_id" {
  description = "snet-test-use-1"
  type        = string
}


## Tags
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
