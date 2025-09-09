output "snet-name" {
  value = { for k, s in azurerm_subnet.this : k => s.id }
}