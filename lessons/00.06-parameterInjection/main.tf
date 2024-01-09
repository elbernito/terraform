terraform {
  # This module is now only being tested with Terraform 1.6.x. However, to make upgrading easier, we are setting
  # 1.6.6 as the minimum version, as that version added support for required_providers with source URLs, making it
  # forwards compatible with 1.6.x code.
  required_version = ">= 1.6.6"
}

# Given "null_resource" resource implements the standard resource lifecycle but takes no further action. Custom name "my_resource"
module "hello_terraform_module" {
  source = "./modules/helloTerraform"
  module_output_text = "Hello from root"
}

