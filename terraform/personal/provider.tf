provider "proxmox" {
  endpoint = var.endpoint
  username = var.username
  password = var.password

  ssh {
    agent       = false
    username    = var.proxmox_node_ssh_user
    private_key = file(var.proxmox_node_privkey_path)
  }
  random_vm_ids = true
}
