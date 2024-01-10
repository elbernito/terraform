variable "mapOfOutputText" {
  description = "This is a variable of type Map of objects"
  type = map(object({
    value = string
  }))
  default = {
    "out_a" = {
      value = "Value A"
    },
    "out_b" = {
      value = "Value B"
    },
    "out_c" = {
      value = "Value C"
    }
  }
}