locals {
  default_visibility = length(var.repositories) == 0 ? "private" : "selected"
  visibility         = var.visibility == "" ? local.default_visibility : var.visibility
}
