data "github_actions_public_key" "public_keys" {
  for_each = var.repositories

  repository = each.value
}

resource "github_actions_secret" "secret" {
  for_each = toset(var.secret_type == "repository" ? var.repositories : [])

  repository      = each.key
  secret_name     = var.name
  plaintext_value = var.value
}
