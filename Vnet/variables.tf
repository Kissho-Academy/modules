variable "name" {
  description = "The name of the resource group"
  type        = string
}

variable "location" {
  description = "The location of the resource group"
  type        = string
}

variable "tags" {
  description = "A map of tags to assign to the resource group"
  type        = map(string)
}

variable "resource_group_name" {
  description = "A map of tags to assign to the resource group"
  type        = string
}
variable "ddos_protection_plan_id" {
  description = "The ID of the DDoS protection plan to associate with the virtual network"
  type        = string
}

variable "address_space" {
  description = "The CIDR block for the virtual network"
  type        = list(string)
  default     = null
  nullable    = true
}

variable "dns_servers" {
  description = "IP addresses of DNS servers to be used by the virtual network"
  type        = list(string)
  default     = null
  nullable    = true
}

variable "ip_address_pool" {
  description = "Optional single IPAM pool to allocate addresses from at VNET level."
  # nullable single object; omit or set to null to skip the block
  type = object({
    id                     = string
    number_of_ip_addresses = string
  })
  default  = null
  nullable = true
}
