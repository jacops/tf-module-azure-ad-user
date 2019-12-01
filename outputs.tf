output "email" {
  value = azuread_user.user.user_principal_name
}

output "password" {
  value = azuread_user.user.password
}

output "id" {
  value = azuread_user.user.id
}
