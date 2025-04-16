resource "proxmox_virtual_environment_vm" "terraform001" {
  name      = "terraform001"
  node_name = "prox10"

  clone {
    vm_id        = data.proxmox_virtual_environment_vm.ubuntu_2204.vm_id
    full         = true
    datastore_id = data.proxmox_virtual_environment_datastores.prox10_datastore_vms.datastores[0].id
  }

  on_boot = true

  memory {
    dedicated = 2048
    floating  = 2048
  }
  cpu {
    cores = 2
    type  = "x86-64-v2-AES" # the "x86-64-v2-AES" is also a good choice (or choose "kvm64" as common safe choice)
    units = 100
  }
  # it adds memory of 16mg automatically as default
  vga {
    type = "serial0"
  }
  # it adds aio=io_uring,backup=true,cache=none,replicate=true automatically as default
  disk {
    #NOTE: when resizeing, the vm will rebooted and resized automatically by cloud-init
    size         = 20
    interface    = "scsi0"
    datastore_id = data.proxmox_virtual_environment_datastores.prox10_datastore_vms.datastores[0].id
    discard      = "on"
    iothread     = true
    ssd          = true
  }
  # it adds firewall=false automatically as default
  network_device {
    bridge = "mzvl1"
  }

  initialization {
    datastore_id = data.proxmox_virtual_environment_datastores.prox10_datastore_vms.datastores[0].id
    user_account {
      password = var.vm_password
      keys     = [trimspace(file(var.vm_ssh_pubkey))]
    }
    ip_config {
      ipv4 {
        address = "dhcp"
      }
    }
    vendor_data_file_id = proxmox_virtual_environment_file.vendor.id
  }
}

resource "proxmox_virtual_environment_file" "vendor" {
  content_type = "snippets"
  datastore_id = data.proxmox_virtual_environment_datastores.prox10_datastore_snippets.datastores[0].id
  node_name    = "prox10"
  file_mode    = "0644"
  source_file {
    path      = "${path.module}/vendor.yaml"
    file_name = "vendor.yaml"
  }
}
