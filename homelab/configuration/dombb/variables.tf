variable "esxi_configuration" {
  description = "This are the parameter for ESXi host"
  type        = map(string)
  default = {
    esxi_diskstore = "TheCluster"
    esxi_hostname  = "192.168.1.60"
    esxi_hostport  = "22"
    esxi_hostssl   = "443"
    esxi_username  = "terraform"
    esxi_password  = "mVmLHR96E6c797AG"
    esxi_vmnet     = "VM Network"
  }
}

variable "vm_theDummyMachine" {
  description = "This are the parameter for TheDummy machine"
  type        = map(string)
  default = {
    machine_name   = "TheDummy"
  }
}