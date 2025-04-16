variable "proxmox_node_privkey" {
  description = "Proxmox node private key as base64 encoded string"
  type        = string
  sensitive   = true
}

variable "vm_password" {
  description = "The password for the VM"
  type        = string
  sensitive   = true
}

variable "vm_ssh_pubkey" {
  description = "The SSH public key for the VM"
  type        = string
}
