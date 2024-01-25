# ================================================================
# This module demands two variables and concat in a single varible
# Afterwards will print to a local echo"
# ================================================================

locals {
  output_text = "${var.echo_text_line_a} ${var.echo_text_line_b}"
}

resource "null_resource" "print_to_exec" {
  # Provisioner for local execution in a bash or shell
  provisioner "local-exec" {
    command = "echo ${output_text}"
  }
}