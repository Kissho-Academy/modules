# Terraform Azure Modules

This repository contains reusable Terraform modules for deploying Azure infrastructure components. Each module is designed for composability, clarity, and ease of use in your cloud projects.

## Available Modules

- **KeyVault**: Provisions an Azure Key Vault with RBAC, private endpoint, and DNS zone integration.
- **KeyVault-Key**: Manages keys within an Azure Key Vault, supporting rotation policies and tagging.
- **NSG**: Creates Azure Network Security Groups with customizable security rules.
- **RT**: Provisions Azure Route Tables with custom routes and tagging.
- **ResourceGroup**: Manages Azure Resource Groups.
- **Subnet**: Creates subnets within a virtual network, supporting NSG, route table, and delegation.
- **Vnet**: Provisions Azure Virtual Networks with address space, DNS, and optional DDoS protection.

## Usage

Each module has its own folder and README with usage instructions, input/output variables, and examples. To use a module, reference its path in your Terraform configuration:

```hcl
module "example_nsg" {
  source = "./NSG"
  name   = "my-nsg"
  # ...other variables...
}
```

## Structure

```
modules/
  KeyVault/
  KeyVault-Key/
  NSG/
  RT/
  ResourceGroup/
  Subnet/
  Vnet/
```

## Getting Started

1. Clone this repository.
2. Review each module's README for details and examples.
3. Integrate modules into your Terraform project as needed.

## Contributing

Contributions are welcome! Please open issues or pull requests for improvements, bug fixes, or new modules.

## License

MIT
