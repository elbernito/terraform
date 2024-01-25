# =============== ESXi Config =========================
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

variable "esxi_diskstore" {
  description = "the diskstore that will used"
  type        = string
}

variable "esxi_vmnet" {
  description = "the vm network for the machine"
  type        = string
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

# =============== New Machine Config =========================

variable "machine_new_ip" {
  description = "The new ip for the vm machine"
  type        = string
}

variable "machine_new_hostname" {
  description = "The new host name for the vm machine"
  type        = string
}

variable "machine_new_gateway" {
  description = "The new gateway ip for the vm machine"
  type        = string
}

variable "machine_new_dns" {
  description = "The new dns for the vm machine"
  type        = string
}
