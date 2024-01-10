variable "esxi_configuration" {
  description = "This are the parameter for ESXi host"
  type        = map(string)
  default = {
    esxi_diskstore = "TheCluster"
    esxi_hostname  = "192.168.1.60"
    esxi_hostport  = "22"
    esxi_hostssl   = "443"
    esxi_vmnet     = "VM Network"
  }
}

variable "esxi_username" {
  description = "The username for esxi host"
  nullable = false
  sensitive = true
  type = string
}

variable "esxi_password" {
  description = "The password for esxi host"
  nullable = false
  sensitive = true
  type = string
}


variable "vm_theDummyMachine" {
  description = "This are the parameter for TheDummy machine"
  type        = map(string)
  default = {
    machine_name   = "TheDummy"
  }
}