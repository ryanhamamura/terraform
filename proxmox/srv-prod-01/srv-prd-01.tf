resource "proxmox_vm_qemu" "srv_prd_01" {
  name = "srv-prd-01"
  desc = "Ubuntu Server"
  vmid = "401"
  target_node = "proxmox"
  onboot = true 

  agent = 1 

  clone = "ubuntu-server-focal-docker"
  full_clone = true 
  cores = 4
  sockets = 1 
  cpu = "host"
  memory = 8192
  
  network {
    bridge = "vmbr0"
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
  ipconfig0 = "ip=192.168.55.3/16,gw=192.168.55.1"
  nameserver = "192.168.55.3"
  ciuser = "ryan"
  sshkeys = <<EOF
  ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGugBUAze+vqUlFxob6TAFOPL0RjjnbmjIMV6n6udBZ3 rhamamur@gmail.com 
  ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHVSghu8oheg1wnPvRM33QFIrBdk2fxhW0rdv2UpIE9w ryan@DESKTOP-JEF2FO5
  EOF
}
