terraform {
  # This module is now only being tested with Terraform 1.6.x. However, to make upgrading easier, we are setting
  # 1.6.6 as the minimum version, as that version added support for required_providers with source URLs, making it
  # forwards compatible with 1.6.x code.
  required_version = ">= 1.6.6"
}

# Writing the hello terraform!
module "hello_terraform_module" {
  source = "./modules/helloTerraform"
  module_output_text = "Hello, Terraform!"
}

# If all done, write "all done!"
module "module_lastMessageOut" {
  source = "./modules/lastMessage"
  depends_on = [ module.hello_terraform_module ]
  module_lastMessageOut = "All done!"
}