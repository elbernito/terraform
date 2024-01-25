# first execution line
variable "echo_text_line_a" {
  description = "Text for the command echo"
  sensitive = false
  type = string
  # When no default value given, terraform will ask for it and/or in a module, the module will demand it
}

# second execution line
variable "echo_text_line_b" {
  description = "Text for the command echo"
  sensitive = false
  type = string
  # When no default value given, terraform will ask for it and/or in a module, the module will demand it
}
