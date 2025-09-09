# Create a static time resource
resource "time_static" "time" {}

# Create an Azure Resource Group
resource "azurerm_resource_group" "this" {
  # Name of the resource group
  name = var.name
  # Location of the resource group
  location = var.location
  # Tags to assign to the resource group, merging provided tags with a created-on timestamp
  tags = merge(
    var.tags,
    {
      CreatedOn = formatdate("DD-MM-YYYY hh:mm", timeadd(time_static.time.id, "1h"))
    }
  )
}

resource "azurerm_management_lock" "rg_lock" {
  name       = "lock-${var.name}"
  scope      = azurerm_resource_group.this.id
  lock_level = "CanNotDelete"
  depends_on = [azurerm_resource_group.this]
  count      = var.enable_lock ? 1 : 0
}
