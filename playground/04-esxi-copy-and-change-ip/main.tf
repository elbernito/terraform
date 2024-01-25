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
resource "esxi_guest" "vmtest04" {
  guest_name = "vmtest04"
  disk_store = var.esxi_diskstore
  guestos    = "centos-64"

  boot_disk_type     = "thin"
  boot_firmware      = "efi"
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

#########################################
#  ESXI Ansible playbock init
#########################################
resource "ansible_playbook" "configure_ip" {
  depends_on = [esxi_guest.vmtest04]
  # =========================================================
  # name has set to ip or host name! Plugin will use this
  # in the ssh command as host... :/
  # =========================================================
  name = esxi_guest.vmtest04.ip_address

  ansible_playbook_binary = "ansible-playbook"
  verbosity               = "6"
  playbook                = "ansible/playbook_change_ip.yaml"
  ignore_playbook_failure = true
  replayable              = true

  # connection configuration and other vars
  extra_vars = {

    check_mode     = true  # validate this playbook
    diff           = false # only for debug. May contains sensitive data
    force_handlers = false # only used in when multiple hosts at once configured

    ansible_hostname     = "${esxi_guest.vmtest04.ip_address}"
    ansible_connection   = "ssh"
    ansible_user         = var.machine_ssh_user_root_name
    ansible_ssh_password = var.machine_ssh_user_root_password

    machine_new_ip       = var.machine_new_ip
    machine_new_hostname = var.machine_new_hostname
    machine_new_dns      = var.machine_new_dns
    machine_new_gateway  = var.machine_new_gateway
  }
}

#########################################
#  ESXI Ansible playbock init
#########################################
resource "ansible_playbook" "check_ip" {
  depends_on = [esxi_guest.vmtest04, ansible_playbook.configure_ip]
  # =========================================================
  # name has set to ip or host name! Plugin will use this
  # in the ssh command as host... :/
  # =========================================================
  name = var.machine_new_ip

  ansible_playbook_binary = "ansible-playbook"
  verbosity               = "6"
  playbook                = "ansible/playbook_check_ip.yaml"
  ignore_playbook_failure = true
  replayable              = true

  # connection configuration and other vars
  extra_vars = {

    check_mode     = true  # validate this playbook
    diff           = false # only for debug. May contains sensitive data
    force_handlers = false # only used in when multiple hosts at once configured

    ansible_hostname     = "${var.machine_new_ip}"
    ansible_connection   = "ssh"
    ansible_user         = var.machine_ssh_user_root_name
    ansible_ssh_password = var.machine_ssh_user_root_password

    machine_new_ip       = var.machine_new_ip
    machine_new_hostname = var.machine_new_hostname

  }
}



