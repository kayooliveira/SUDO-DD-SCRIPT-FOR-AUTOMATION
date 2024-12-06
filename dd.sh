#!/bin/bash

clear

function Menu() {
    echo ""
    echo "======================================"
    echo "      Select the disk to be used      "
    echo "======================================"
    lsblk
    echo -e '\n'
    echo "======================================"
    echo "Don't forget the disk prefix (e.g., /dev/sda1, /dev/sdb)."
    echo "======================================"
    echo

    while true; do
        read -p "Enter target disk (/dev/sdX#): " disk
        if [[ "$disk" =~ ^/dev/sd[a-z][0-9]*$ ]]; then
            break
        else
            echo "Invalid disk input. Please use the format /dev/sdX# (e.g., /dev/sda1)."
        fi
    done

    clear
    echo ""
    echo "======================================"
    echo -e "WARNING: All data on $disk will be lost!"
    echo "======================================"
    read -p "Type 'YES' to confirm and continue: " confirmation
    if [[ "$confirmation" != "YES" ]]; then
        echo "Operation cancelled."
        exit 0
    fi
    clear

    GetISO
}


function GetISO() {
    echo ""
    echo "========================================================"
    echo "Enter the full path to the ISO image file:"
    echo "Example: /home/user/Desktop/image.iso"
    echo "========================================================"
    echo

    while true; do
        read -p "Enter ISO image path: " local
        if [[ -f "$local" ]]; then
            break
        else
            echo "Invalid file path.  Please enter a valid path to an existing ISO file."
        fi
    done
    WriteImage
}


function WriteImage() {
    echo -e "Writing image $local to $disk..."
    #Unmount if mounted
    if mountpoint "$disk" ; then
        umount "$disk" || { echo "Error unmounting $disk"; exit 1; }
    fi

    #Check if the device is a block device
    if [[ ! -b "$disk" ]]; then
        echo "Error: $disk is not a block device."
        exit 1
    fi

    # Use pv for progress bar
    sudo pv -p "$local" | sudo dd of="$disk" bs=4M status=progress conv=fsync
    if [ $? -ne 0 ]; then
        echo "Error writing image to disk."
        exit 1
    fi

    echo -e '\n\n\n'
    echo "Operation completed."
    echo "What you want to do?"
    read -p "[ 1 ] EXIT   /   [ 2 ] BACK : " function
    case $function in
        1) exit ;;
        2) Menu ;;
        *) echo "Invalid choice."; exit 0 ;;
    esac
}

clear
Menu
