variable "ami" {
  type = string
  default = {
    "ProjectA" = "ami-e333fdf",
    "ProjectB" = "ami-dfdkfer3ff"
  }
}

variable "app_region" {
  type = string
  default = "ca-central-1"
}