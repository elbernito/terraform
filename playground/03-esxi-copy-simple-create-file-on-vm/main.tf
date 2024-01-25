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
resource "esxi_guest" "vmtest03" {
  guest_name = "vmtest03"
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

resource "ansible_playbook" "configure_ip" {
  depends_on = [esxi_guest.vmtest03]
  # =========================================================
  # name has set to ip or host name! Plugin will use this
  # in the ssh command as host... :/
  # =========================================================
  name = esxi_guest.vmtest03.ip_address

  ansible_playbook_binary = "ansible-playbook"
  verbosity               = "6"
  playbook                = "ansible/playbook.yaml"
  ignore_playbook_failure = true
  replayable              = true

  # connection configuration and other vars
  extra_vars = {

    check_mode     = false # validate this playbook
    diff           = false # only for debug. May contains sensitive data
    force_handlers = false # only used in when multiple hosts at once configured

    ansible_hostname   = "${esxi_guest.vmtest03.ip_address}"
    ansible_connection = "ssh"
    ansible_user       = var.machine_ssh_user_root_name
    #ansible_ssh_private_key_file   = "id_rsa"
    ansible_ssh_password = var.machine_ssh_user_root_password
  }

}


