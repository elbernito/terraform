#
#  Outputs are a great way to output information about your apply.
#

output "ip" {
  value = esxi_guest.vmtest04.ip_address
}

