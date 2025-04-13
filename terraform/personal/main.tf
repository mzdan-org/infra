resource "proxmox_virtual_environment_vm" "terraform001" {
  name      = "terraform001"
  node_name = "prox10"

  clone {
    vm_id        = data.proxmox_virtual_environment_vm.ubuntu_2204.vm_id
    full         = true
    datastore_id = data.proxmox_virtual_environment_datastores.prox10_datastores.datastores[0].id
  }

  on_boot = true

  memory {
    dedicated = 2048
  }
  cpu {
    cores = 2
  }
  disk {
    size         = 20
    interface    = "scsi0"
    datastore_id = data.proxmox_virtual_environment_datastores.prox10_datastores.datastores[0].id
    discard      = "on"
    iothread     = true
    ssd          = true
  }
  network_device {
    bridge = "mzvl1"
  }

  initialization {
    datastore_id = data.proxmox_virtual_environment_datastores.prox10_datastores.datastores[0].id
    user_account {
      password = var.vm_password
      keys     = [file(var.vm_ssh_pubkey)]
    }
    ip_config {
      ipv4 {
        address = "dhcp"
      }
    }
  }
}
