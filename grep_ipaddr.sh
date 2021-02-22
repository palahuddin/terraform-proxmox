#!/bin/bash

rm -rf inventory
terraform output -json > ipaddress
jq -r '.[] | .value' ipaddress > ipaddr
echo "[proxmox]" > tmp/inventory

    array1=() # Create array
        while IFS= read -r ipaddr ; # Read a line
        do
            array1+=("$ipaddr")
        done < "ipaddr"

    for record in ${!array1[*]};
    do
    echo "
    [pgbackrest]
    pgbackrest-host ansible_host=192.168.0.253 ansible_user=example

    
    " >> tmp/inventory
    echo "
    [dbserver]
    ${array1[$record]}-new-db ansible_host=${array1[$record]} ansible_user=example" >> tmp/inventory
    done
    mv ipaddr tmp/
