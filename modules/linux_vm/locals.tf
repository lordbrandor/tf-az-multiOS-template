locals {
  tags = {
    GitRepo            = var.gitrepo
    Owner              = var.owner
    Department         = var.department
    StartDate          = timestamp()
    ApplicationName    = var.application_name
    Approver           = var.approver
    CostCenter         = var.cost_center
    Criticality        = var.criticality
    Environment        = var.env
    Purpose            = var.purpose
    DataClassification = var.dataclass
  }
}
