# This  resource captures the time when Terraform is first applied.
resource "time_static" "time" {}

# This resource creates an Azure Resource Group.
resource "azurerm_resource_group" "this" {
  # Name of the resource group, provided via variable.
  name = var.name

  # Location of the resource group, provided via variable.
  location = var.location

  # Tags to assign to the resource group.
  # Merges user-provided tags with a 'CreatedOn' timestamp.
  tags = merge(
    var.tags,
    {
      # 'CreatedOn' tag uses the static time, formatted as DD-MM-YYYY hh:mm and adds 1 hour.
      CreatedOn = formatdate("DD-MM-YYYY hh:mm", timeadd(time_static.time.id, "1h"))
    }
  )
}

# Optionally create a management lock on the resource group to prevent deletion.
resource "azurerm_management_lock" "this" {
  count = var.lock != null ? 1 : 0

  lock_level = var.lock.kind
  name       = coalesce(var.lock.name, "lock-${var.lock.kind}")
  scope      = azurerm_resource_group.this.id
  notes      = var.lock.kind == "CanNotDelete" ? "Cannot delete the resource or its child resources." : "Cannot delete or modify the resource or its child resources."
}
