data "github_repository" "repositories" {
  for_each = var.repositories

  full_name = "${var.owner}/${each.value}"
}

resource "github_actions_organization_secret" "secret" {
  for_each = toset(var.secret_type == "organization" ? [var.name] : [])

  secret_name             = var.name
  visibility              = local.visibility
  plaintext_value         = var.value
  selected_repository_ids = [for repo in data.github_repository.repositories : repo.repo_id]
}
