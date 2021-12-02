variable "name" {
  type = string
}

variable "owner" {
  type = string
}

variable "repositories" {
  type    = set(string)
  default = []
}

variable "value" {
  type      = string
  sensitive = true
}

variable "secret_type" {
  type = string
  validation {
    condition     = contains(["organization", "repository"], var.secret_type)
    error_message = "Secret type must be organization or repository."
  }
}

variable "visibility" {
  type    = string
  default = ""
}
