output "ipv4_addresses" {
  value = proxmox_virtual_environment_vm.terraform001.ipv4_addresses[1][0]
}

output "hostname" {
  value = proxmox_virtual_environment_vm.terraform001.name
}

output "vm_id" {
  value = proxmox_virtual_environment_vm.terraform001.vm_id
}
