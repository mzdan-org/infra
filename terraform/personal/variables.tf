variable "endpoint" {
  description = "Proxmox endpoint"
  type        = string
}

variable "username" {
  description = "Proxmox username"
  type        = string
}

variable "password" {
  description = "Proxmox password"
  type        = string
  sensitive   = true
}

variable "proxmox_node_privkey_path" {
  description = "Proxmox node private key path"
  type        = string
}

variable "proxmox_node_ssh_user" {
  description = "The ssh user used for connection to proxmox node"
  type        = string
  default     = "root"
}

variable "vm_password" {
  description = "The password for the VM"
  type        = string
  sensitive   = true
}

variable "vm_ssh_pubkey" {
  description = "The SSH public key for the VM"
  type        = string
  sensitive   = true
}
