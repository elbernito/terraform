terraform {
  # This module is now only being tested with Terraform 1.6.x. However, to make upgrading easier, we are setting
  # 1.6.6 as the minimum version, as that version added support for required_providers with source URLs, making it
  # forwards compatible with 1.6.x code.
  required_version = ">= 1.6.6"
}

module "print_to_exec"  {
  source = "./modules/execEcho"
  echo_text_line_a = "Hello,"
  echo_text_line_b = "World"
}


# An output 
output "the_end" {	
	value = "Run done!"
}