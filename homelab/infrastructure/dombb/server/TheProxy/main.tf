# =============================================================
# Creates the instances on DOMBB ESXi
# =============================================================
module "create_theDummyMachine" {
  source                         = "../../../../modules/esxi/copy_machine"
  esxi_hostname                  = var.esxi_hostname
  esxi_hostport                  = var.esxi_hostport
  esxi_hostssl                   = var.esxi_hostssl
  esxi_username                  = var.esxi_username
  esxi_password                  = var.esxi_password
  esxi_diskstore                 = var.esxi_diskstore
  esxi_vmnet                     = var.esxi_vmnet
  machine_new_ip                 = var.machine_new_ip
  machine_new_hostname           = var.machine_new_hostname
  machine_new_gateway            = var.machine_new_gateway
  machine_new_dns                = var.machine_new_dns
  machine_ssh_user_root_name     = var.machine_ssh_user_root_name
  machine_ssh_user_root_password = var.machine_ssh_user_root_password
}
