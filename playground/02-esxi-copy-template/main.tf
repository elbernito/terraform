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
resource "esxi_guest" "vmtest02" {
  guest_name = "vmtest02"
  disk_store = var.esxi_diskstore
  guestos    = "centos-64"

  boot_disk_type = "thin"
  boot_firmware  = "efi"
  #boot_disk_size = "40" #baseimage has 40GB ! lower value not working!

  #memsize            = "2048"
  #numvcpus           = "2"
  resource_pool_name = "/"

  power = "on"

  # This is the name for the original VM that will cloned. The Original path is not correct
  # and wie have go 4 direct up to correct place to find the original.
  clone_from_vm = "../../../../RockyLinux_93_2C_40GB"

  #ovf_source        = "my_local_system_path/centos-7-min/centos-7.vmx"

  network_interfaces {
    virtual_network = var.esxi_vmnet
    #mac_address     = "00:50:56:a1:b1:c2"
    #nic_type        = "e1000"
  }

  guest_startup_timeout  = 45
  guest_shutdown_timeout = 30

}


