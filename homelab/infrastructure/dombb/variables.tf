# ======================================================
# ESXi configuration
# ======================================================

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
  nullable    = false
  sensitive   = true
  type        = string
}

variable "esxi_password" {
  description = "The password for esxi host"
  nullable    = false
  sensitive   = true
  type        = string
}

# ======================================================
# Common credentials for a machine
# ======================================================
variable "machine_ssh_user_root_name" {
  description = "The root username for vm machine"
  nullable    = false
  sensitive   = true
  type        = string
}

variable "machine_ssh_user_root_password" {
  description = "The root password for vm machine"
  nullable    = false
  sensitive   = true
  type        = string
}

# ======================================================
# Machine configurations
# ======================================================

variable "vm_theDummy" {
  description = "This are the parameter for TheDummy machine"
  type        = map(string)
  default = {
    machine_name = "TheDummy"
  }
}

variable "vm_theTheProxy" {
  description = "This are the parameter for TheProxy machine"
  type        = map(string)
  default = {
    machine_ip      = "192.168.1.80"
    machine_name    = "TheProxy"
    machine_gateway = "192.168.1.1"
    machine_dns     = "192.168.1.1"
  }
}
