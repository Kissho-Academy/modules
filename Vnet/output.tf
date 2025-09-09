output "id" {
  description = "Output the VNets ID"
  value       = azurerm_virtual_network.this.*.id
}

output "name" {
  description = "Output the VNets name"
  value       = azurerm_virtual_network.this.*.name
}