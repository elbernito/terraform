variable "esxi_hostname" {
  description = "the host name or ip for esxi server"
  type        = string
}

variable "esxi_hostport" {
  description = "the host port for esxi server"
  type        = string
}

variable "esxi_hostssl" {
  description = "the host ssl port for esxi server"
  type        = string
}

variable "esxi_username" {
  description = "the user name for esxi server"
  type        = string
}

variable "esxi_password" {
  description = "the user password for esxi server"
  type        = string
}

variable "esxi_diskstore" {
  description = "the diskstore that will used"
  type        = string
}

variable "esxi_vmnet" {
  description = "the vm network for the machine"
  type        = string
}

variable "machine_name" {
  description = "the new machine name"
  type        = string
}
