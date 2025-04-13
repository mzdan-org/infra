provider "proxmox" {
  endpoint = var.endpoint
  username = var.username
  password = var.password

  ssh {
    agent       = false
    private_key = file(var.proxmox_node_privkey_path)
    username    = var.proxmox_node_ssh_user
  }
  random_vm_ids = true
}
