# Output the ID of the resource group
output "id" {
  description = "The ID of the resource group"
  value       = azurerm_resource_group.this.id
}

# Output the Name of the resource group
output "name" {
  description = "The Name of the resource group"
  value       = azurerm_resource_group.this.name
}

# Output the Name of the resource group
output "location" {
  description = "The location of the resource group"
  value       = azurerm_resource_group.this.location
}

output "tags" {
  description = "The complete tags applied to the resource group"
  value       = azurerm_resource_group.this.tags
}
