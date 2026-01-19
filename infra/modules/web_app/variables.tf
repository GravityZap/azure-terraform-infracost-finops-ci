variable "name" { type = string }
variable "location" { type = string }
variable "sku" { type = string }
variable "rg_name" { type = string }
variable "instance_count" { type = number }

variable "enable_insights" {
  type    = bool
  default = false
}

variable "enable_storage" {
  type    = bool
  default = false
}

variable "enable_autoscale" {
  type    = bool
  default = false
}

variable "autoscale_min" {
  type    = number
  default = 1
}

variable "autoscale_max" {
  type    = number
  default = 3
}
