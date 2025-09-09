# Variable to specify the name of the resource group
variable "name" {
  type        = string
  description = "Name of the resource group (include env code, 90 chars max, alphanumeric, '-', '_' allowed)"
  validation {
    condition     = length(var.name) <= 90
    error_message = "Resource group name must be 90 characters or less."
  }
}

# Variable to specify the location of the resource group
variable "location" {
  description = "The location of the resource group"
  type        = string
}

# Variable to specify a map of tags to assign to the resource group
variable "tags" {
  description = "A map of tags to assign to the resource group"
  type        = map(string)
  default     = {}
}

variable "enable_lock" {
  description = "Enable a CanNotDelete lock on the resource group"
  type        = bool
  default     = false   
}