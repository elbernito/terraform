# ==============================================================
#  This creates a dummy machine on esxi host and it's meant 
#  for checking all esxi services are functional
# ==============================================================

terraform {
  # This module is now only being tested with Terraform 1.6.x. However, to make upgrading easier, we are setting
  # 1.6.6 as the minimum version, as that version added support for required_providers with source URLs, making it
  # forwards compatible with 1.6.x code.
  required_version = ">= 1.6.6"
}

# Creates the instances on DOMBB ESXi
module "create_theDummyMachine" {
  source         = "../../../../modules/esxi/create_dummyMachine"
  esxi_hostname  = var.esxi_hostname
  esxi_hostport  = var.esxi_hostport
  esxi_hostssl   = var.esxi_hostssl
  esxi_username  = var.esxi_username
  esxi_password  = var.esxi_password
  esxi_diskstore = var.esxi_diskstore
  esxi_vmnet     = var.esxi_vmnet
  machine_name   = var.machine_name
}
