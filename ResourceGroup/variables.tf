# Name of the resource group to be created.
# Should include environment code, be 90 characters or less, and only contain alphanumeric, '-', or '_' characters.
variable "name" {
  type        = string
  description = "Name of the resource group (include env code, 90 chars max, alphanumeric, '-', '_' allowed)"
  validation {
    condition     = length(var.name) <= 90
    error_message = "Resource group name must be 90 characters or less."
  }
}

# Location where the resource group will be deployed (e.g., 'westeurope').
variable "location" {
  description = "The location of the resource group"
  type        = string
}

# Map of tags to assign to the resource group for organization and cost management.
variable "tags" {
  description = "A map of tags to assign to the resource group"
  type        = map(string)
  default     = {}
}

# Enable a 'CanNotDelete' management lock on the resource group for protection against accidental deletion.
variable "enable_lock" {
  description = "Enable a CanNotDelete lock on the resource group"
  type        = bool
  default     = false
}
