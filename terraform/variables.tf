variable "vpshere_user" {
  description = "The VSphere User."
  type        = string
  default = "user"
}

variable "vsphere_password" {
  description = "The VSphere Password."
  type        = string
  default = "password"
}

variable "vsphere_server" {
  description = "The VSphere Server."
  type        = string
  default = "192.168.1.10"
}
