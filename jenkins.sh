#!/bin/bash

sed -i '/NewServers/,$d' example.tf
echo "###NewServers###" >> example.tf

sed -i '/NewServers/,$d' output.tf
echo "###NewServers###" > output.tf

echo "
resource \"proxmox_vm_qemu\" \"example_$3\" {
    name        = \"$3\"
    vmid       = 4$4
    target_node = \"$6\"
    clone       = \"$7\"
    os_type     = \"cloud-init\"
    scsihw      = \"virtio-scsi-pci\"
    bootdisk    = \"scsi0\"
    balloon     = $2
    memory      = 30720
    full_clone  = true
    cores       = 8
    sockets     = 2
    vcpus       = $1
    numa        = true
    hotplug     = \"network,disk,usb,cpu,memory\"

    network {
        model   = \"virtio\"
        bridge  = \"vmbr0\"
    }

    # Cloud Init Settings
    ipconfig0 = \"ip=$5/24,gw=192.168.0.1\"
    sshkeys = \" ssh ....\"
}

 " > input.txt
 echo "
 output \"ipaddr_$3\" {
  value = proxmox_vm_qemu.example_$3.ssh_host
}
 " > output.txt
  
        sed -i '/NewServers/r input.txt' example.tf
        sed -i '/NewServers/r output.txt' output.tf
        rm -rf input.txt output.txt
        
