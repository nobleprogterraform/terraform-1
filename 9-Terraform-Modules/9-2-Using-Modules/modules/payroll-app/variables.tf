variable "ami" {
  type = string
}

variable "app_region" {
  type = string
}

variable "bucket" {
  type = string
  default = "payroll-app-default-bucket"
}