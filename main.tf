resource "random_string" "password" {
  length  = 16
  special = false
}

data "azuread_domains" "main" {
  only_default = true
}

locals {
  user_principal_name = coalesce(var.username, lower(replace(var.name, " ", ".")))
}

resource "azuread_user" "user" {
  display_name          = var.name
  password              = random_string.password.result
  user_principal_name   = "${local.user_principal_name}@${data.azuread_domains.main.domains.0.domain_name}"
  force_password_change = true

  lifecycle {
    ignore_changes = [password, force_password_change]
  }
}
