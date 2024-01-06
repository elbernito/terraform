# Given "null_resource" resource implements the standard resource lifecycle but takes no further action. Custom name "my_resource"
resource "null_resource" "my_resource" {

  # Provisioner for local execution in a bash or shell
  provisioner "local-exec" {
    command = "echo ${var.output_text}"
  }

}

