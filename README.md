---

# Proxmox VM Deployment with Terraform

This Terraform project deploys Virtual Machines (VMs) on a Proxmox host. It allows customization of the number of VMs, CPU cores, memory, disk size, and other attributes. The VMs are cloned from a specified template and are configured with the specified network and disk settings.

## Prerequisites

- Terraform >= 0.13
- Proxmox host accessible via API
- Proxmox Terraform provider (telmate/proxmox) version 2.9.11

## Configuration

Configuration is handled through Terraform variables and `.tfvars` files. Sensitive information like API tokens can be supplied via `terraform.auto.tfvars`.

### Required Variables

- `pm_api_url`: Proxmox API URL.
- `pm_api_token_id`: API Token ID for Proxmox.
- `pm_api_token_secret`: API Token Secret for Proxmox.
- `ssh_key`: SSH public key to be added to the VMs.

### Optional Variables

Various options for customizing the VMs can be found in `variables.tf`, including:

- `vm_count`: Number of VMs to deploy.
- `proxmox_host`: Proxmox host to deploy VMs on.
- `vmid_begin`: Starting VMID.
- `template_name`: Template to clone VMs from.
- `cores`, `memory`, `disk_size`: VM resource allocation.
- `proxmox_storage`: Storage to allocate VM disks on.
- `proxmox_network_bridge`: Network bridge to attach VMs to.

## Usage

1. **Initialize Terraform**: Initialize the Terraform project with the required providers:

   ```bash
   terraform init
   ```

2. **Plan Deployment**: Preview the resources that will be created:

   ```bash
   terraform plan
   ```

3. **Apply Configuration**: Apply the configuration to create the resources:

   ```bash
   terraform apply
   ```

4. **Destroy Resources**: If needed, destroy the created resources:

   ```bash
   terraform destroy
   ```

## Troubleshooting

Logging is enabled in the provider configuration. Check `terraform-plugin-proxmox.log` for detailed logs if encountering any issues.



---
