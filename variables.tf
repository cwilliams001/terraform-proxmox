## Required variables
variable "pm_api_url" {
  type = string
}

variable "pm_api_token_id" {
  type      = string
  sensitive = true
}

variable "pm_api_token_secret" {
  type      = string
  sensitive = true
}


## Optional variables
variable "vm_count" {
  default     = 3
  type        = number
  description = "Number of VMs to deploy"
}

variable "proxmox_host" {
  default     = "hv3"
  type        = string
  description = "Proxmox host to deploy VMs on"
}

variable "vmid_begin" {
  default     = 200
  type        = number
  description = "First VMID to use. Be advised this will end up being 2001..2002..2003 because of the count + 1 logic"
}

variable "template_name" {
  default     = "ubuntu-22.04-base-20230817134135"
  type        = string
  description = "Template to clone VMs from"
}

variable "cores" {
  default     = 2
  type        = number
  description = "Number of cores to allocate to VMs"
}

variable "memory" {
  default     = 2048
  type        = number
  description = "Amount of memory to allocate to VMs"
}

variable "disk_size" {
  default     = "40G"
  type        = string
  description = "Size of disk to allocate to VMs"
}

variable "proxmox_storage" {
  default     = "sata_pool"
  type        = string
  description = "Storage to allocate VM disks on"
}

variable "proxmox_network_bridge" {
  default     = "vmbr70"
  type        = string
  description = "Network bridge to attach VMs to"
}

variable "ssh_key" {
  sensitive   = true
  description = "SSH Key you want to add"
  type        = string
}