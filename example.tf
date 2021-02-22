###NewServers###

resource "proxmox_vm_qemu" "example_" {
    name        = ""
    vmid       = 4
    target_node = ""
    clone       = ""
    os_type     = "cloud-init"
    scsihw      = "virtio-scsi-pci"
    bootdisk    = "scsi0"
    balloon     = 
    memory      = 30720
    full_clone  = true
    cores       = 8
    sockets     = 2
    vcpus       = 
    numa        = true
    hotplug     = "network,disk,usb,cpu,memory"

    network {
        model   = "virtio"
        bridge  = "vmbr0"
    }

    # Cloud Init Settings
    ipconfig0 = "ip=/24,gw=192.168.0.1"
    sshkeys = " ssh ...."
}

 
