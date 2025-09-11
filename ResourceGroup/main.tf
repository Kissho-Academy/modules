# This resource captures the time when Terraform is first applied.
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
resource "azurerm_management_lock" "rg_lock" {
  # Lock name includes the resource group name.
  name = "lock-${var.name}"

  # Scope of the lock is the resource group.
  scope = azurerm_resource_group.this.id

  # Lock level set to 'CanNotDelete' to prevent accidental deletion.
  lock_level = "CanNotDelete"

  # Ensure the lock is created after the resource group.
  depends_on = [azurerm_resource_group.this]

  # Only create the lock if 'enable_lock' variable is true.
  count = var.lock ? 1 : 0
}
