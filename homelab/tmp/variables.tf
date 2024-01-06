variable "esxi_dummyMachine" {
  description = "This is a variable of type map"
  type        = map(string)
  default = {
    machine_name  = "TheDummy"
    esxi_diskstore    = "TheCluster"
    esxi_hostname = "192.168.1.60"
    esxi_hostport = "22"
    esxi_hostssl  = "443"
    esxi_username = "terraform"
    esxi_password = "mVmLHR96E6c797AG"
  }
}

variable "esxi_hostname" {
}

variable "esxi_hostport" {
}

variable "esxi_hostssl" {
}

variable "esxi_username" {
}

variable "esxi_password" { # Unspecified will prompt
}

variable "esxi_diskstore" { # Unspecified will prompt
}

variable "machine_name" { # Unspecified will prompt
}