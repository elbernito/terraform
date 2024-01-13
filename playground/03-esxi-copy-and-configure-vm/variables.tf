#
#  See https://www.terraform.io/intro/getting-started/variables.html for more details.
#

#  Change these defaults to fit your needs!

variable "esxi_hostname" {
  default = "192.168.1.60"
}

variable "esxi_hostport" {
  default = "22"
}

variable "esxi_hostssl" {
  default = "443"
}

variable "esxi_diskstore" {
   default = "TheCluster"
  
}

variable "esxi_vmnet" {
  description = "the vm network for the machine"
  type        = string
  default     = "VM Network"
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