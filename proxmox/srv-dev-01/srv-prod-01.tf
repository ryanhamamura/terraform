resource "proxmox_vm_qemu" "srv_dev_01" {
  name = "srv-dev-01"
  desc = "Ubuntu Server"
  vmid = "402"
  target_node = "proxmox"

  agent = 1 

  clone = "ubuntu-server-focal-docker"
  full_clone = true 
  cores = 2
  sockets = 1 
  cpu = "host"
  memory = 2048
  
  network {
    bridge = "vmbr2"
    model = "virtio"
  }

  disk {
    storage = "local-lvm"
    type = "virtio"
    size = "64G"
    format = "raw"
  }
  
  scsihw = "virtio-scsi-pci"
  os_type = "cloud-init"
  cloudinit_cdrom_storage = "local-lvm"
  ipconfig0 = "ip=192.168.55.4/24,gw=192.168.55.1"
  nameserver = "192.168.55.1"
  ciuser = "ryan"
  sshkeys = <<EOF
  ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGugBUAze+vqUlFxob6TAFOPL0RjjnbmjIMV6n6udBZ3 rhamamur@gmail.com 
  EOF
}
