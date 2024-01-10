terraform {
  # This module is now only being tested with Terraform 1.6.x. However, to make upgrading easier, we are setting
  # 1.6.6 as the minimum version, as that version added support for required_providers with source URLs, making it
  # forwards compatible with 1.6.x code.
  required_version = ">= 1.6.6"
}

locals {
  # -------------- esxi --------------------
  esxi_hostName  = var.esxi_configuration["esxi_hostname"]
  esxi_hostPort  = var.esxi_configuration["esxi_hostport"]
  esxi_hostSsl   = var.esxi_configuration["esxi_hostssl"]
  esxi_username  = var.esxi_username #"terraform"
  esxi_password  = var.esxi_password #"mVmLHR96E6c797AG"
  esxi_diskstore = var.esxi_configuration["esxi_diskstore"]
  esxi_vmnet     = var.esxi_configuration["esxi_vmnet"]
  # -------------- esxi --------------------
  vm_thedummy_machineName = var.vm_theDummyMachine["machine_name"]
}

# Installs "TheDummy" on esxi host
module "server_theDummy" {
  source         = "./server/TheDummy"
  esxi_hostname  = local.esxi_hostName
  esxi_hostport  = local.esxi_hostPort
  esxi_hostssl   = local.esxi_hostSsl
  esxi_username  = local.esxi_username
  esxi_password  = local.esxi_password
  esxi_diskstore = local.esxi_diskstore
  esxi_vmnet     = local.esxi_vmnet
  machine_name   = local.vm_thedummy_machineName
}

