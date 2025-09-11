# ResourceGroup Terraform Module

This module provisions an Azure Resource Group with optional management lock and custom tags. It is designed for use in larger Terraform projects where resource group management and protection are required.

## Features

- Creates an Azure Resource Group in a specified location
- Applies custom tags, including a `CreatedOn` timestamp
- Optionally adds a `CanNotDelete` management lock to prevent accidental deletion
- Outputs resource group details for use in other modules

## Usage

```hcl
module "resource_group" {
  source    = "../ResourceGroup" # Adjust path as needed
  name      = "my-rg-prod"
  location  = "westeurope"
  tags      = {
    environment = "production"
    owner       = "team-xyz"
  }
  enable_lock = true # Optional, default is false
}
```

## Input Variables

| Name        | Type        | Description                                                                | Default |
| ----------- | ----------- | -------------------------------------------------------------------------- | ------- |
| name        | string      | Name of the resource group (90 chars max, alphanumeric, '-', '\_' allowed) | n/a     |
| location    | string      | The Azure region for the resource group                                    | n/a     |
| tags        | map(string) | Map of tags to assign to the resource group                                | `{}`    |
| enable_lock | bool        | Enable a 'CanNotDelete' lock on the resource group                         | `false` |

## Outputs

| Name     | Description                                     |
| -------- | ----------------------------------------------- |
| id       | The ID of the resource group                    |
| name     | The name of the resource group                  |
| location | The location of the resource group              |
| tags     | The complete tags applied to the resource group |

## Example Output

After applying, you can reference outputs like:

```hcl
output "rg_id" {
  value = module.resource_group.id
}
```

## Notes

- The `CreatedOn` tag is automatically added and set to the time of the first Terraform apply (plus one hour).
- The management lock is only created if `enable_lock` is set to `true`.

## License

Post Group
