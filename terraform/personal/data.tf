data "proxmox_virtual_environment_vm" "ubuntu_2204" {
  node_name = "prox10"
  vm_id     = 9002
}

data "proxmox_virtual_environment_datastores" "prox10_datastores" {
  node_name = "prox10"
  filters = {
    id = "vms-zfs"
  }
}
