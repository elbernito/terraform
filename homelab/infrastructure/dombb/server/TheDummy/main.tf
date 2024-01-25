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
