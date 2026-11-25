variable "image" {
  type  = string
  default = "nginx:latest"
    validation {
    condition     = can(regex("^nginx", var.image))
    error_message = "L'image doit être une image nginx."
  }
}

variable "memory" {
  type  = number
  default = 1024
  validation {
    condition     = var.memory >= 128
    error_message = "memory doit être >= 128 Mo."
  }
}

variable "nbr_container" {
  type  = number
  default = 1
}

variable "starting_port" {
  type  = number
  default = 8000
    validation {
    condition     = var.starting_port >= 1024 && var.starting_port <= 65535
    error_message = "starting_port doit être entre 1024 et 65535."
  }
}

variable "isPriviledged" {
  type  = bool
  default = false
}