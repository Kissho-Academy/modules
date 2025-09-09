resource "time_static" "time" {}

resource "azurerm_virtual_network" "this" {
  name                = var.name
  address_space       = var.address_space != [] ? var.address_space : null
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_servers         = var.dns_servers != [] ? var.dns_servers : null
  ddos_protection_plan {
    enable = true
    id     = var.ddos_protection_plan_id
  }
  dynamic "ip_address_pool" {
    for_each = var.ip_address_pool == null ? [] : [var.ip_address_pool]
    content {
      id                     = ip_address_pool.value.id
      number_of_ip_addresses = ip_address_pool.value.number_of_ip_addresses
    }
  }
  tags = merge(
    var.tags,
    {
      CreatedOn = formatdate("DD-MM-YYYY hh:mm", timeadd(time_static.time.id, "1h"))
    }
  )
}
