provider "proxmox" {
  ssh {
    agent       = false
    private_key = base64decode(var.proxmox_node_privkey)
  }
  random_vm_ids = true
}
