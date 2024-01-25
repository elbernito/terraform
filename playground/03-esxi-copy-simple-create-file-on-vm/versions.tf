
terraform {
  required_version = ">= 1.6.6"
  required_providers {
    esxi = {
      source = "registry.terraform.io/josenk/esxi"
    }
    ansible = {
      version = "~> 1.1.0"
      source  = "ansible/ansible"
    }
  }
}
