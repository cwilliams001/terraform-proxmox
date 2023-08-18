resource "proxmox_vm_qemu" "kube-master" {
  count       = var.vm_count
  name        = "TEST-kube-node-0${count.index + 1}"
  desc        = "kube-node-0${count.index + 1}"
  vmid        = var.vmid_begin + count.index + 1
  target_node = var.proxmox_host
  onboot      = true
  clone       = var.template_name
  agent       = 1
  os_type     = "cloud-init"
  cores       = var.cores
  sockets     = 1
  cpu         = "host"
  memory      = var.memory
  scsihw      = "virtio-scsi-pci"
  bootdisk    = "scsi0"

  disk {
    slot    = 0
    size    = var.disk_size
    type    = "scsi"
    storage = var.proxmox_storage
  }

  network {
    model  = "virtio"
    bridge = var.proxmox_network_bridge
  }

  lifecycle {
    ignore_changes = [
      network,
    ]
  }

  ipconfig0 = "ip=10.70.10.10${count.index + 1}/16,gw=10.70.0.1"

  sshkeys = <<EOF
  ${var.ssh_key}
  EOF

}