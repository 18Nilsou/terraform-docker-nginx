variable "image" {
  type  = string
  default = "nginx:latest"
}

variable "memory" {
  type  = number
  default = 1024
}

variable "nbr_container" {
  type  = number
  default = 1
}

variable "starting_port" {
  type  = number
  default = 8000
}

variable "isPriviledged" {
  type  = bool
  default = false
}