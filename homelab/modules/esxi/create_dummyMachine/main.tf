#########################################
#  ESXI Provider host/login details
#########################################
#
#   Use of variables here to hide/move the variables to a separate file
#
provider "esxi" {
  esxi_hostname = var.esxi_hostname
  esxi_hostport = var.esxi_hostport
  esxi_hostssl  = var.esxi_hostssl
  esxi_username = var.esxi_username
  esxi_password = var.esxi_password
}

#########################################
#  ESXI Guest resource
#########################################
#
#  This Guest VM is "bare-metal".   It will be powered on by default
#  by terraform, but it will not boot to any OS.   It will however attempt
#  to network boot.
#
resource "esxi_guest" "create_dummyMachine" {
  guest_name = var.machine_name   # Required, Specify the Guest Name
  disk_store = var.esxi_diskstore # Required, Specify an existing Disk Store
  virthwver = 19 # Not required, origin is on version 13 (ESXi 6.5) and we are newer on 19 (ESXi 7.03b)
  network_interfaces {
    virtual_network = var.esxi_vmnet
    #virtual_network = "VM Network" # Required for each network interface, Specify the Virtual Network name.
  }
}

output "name" {
  value = var.machine_name
}

