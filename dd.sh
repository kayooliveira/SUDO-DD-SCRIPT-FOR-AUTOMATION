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
    echo "Don't forget the disk prefix, example:"
    echo "         /sda1, /sda2, /sda3, /sda4 ...          "
    echo "======================================"
    echo
    read -p "Type here:" disk
    clear
    echo ""
    echo "======================================"
    echo -e "Remember, \033[01;33mall data contained in"
    echo -e "    $disk will be lost\033[01;37m."
    echo "======================================"
    echo " Press CTRL+C to stop or wait 5sec to "
    echo "             continue."
    sleep 5
    clear
    echo ""
    echo "========================================================"
    echo "Now, write the directory of the ISO image to be written."
    echo -e "Example: \033[01;33m/home/username/Desktop/image.iso\033[01;37m"
    echo "========================================================"
    echo
    read -e -p "Type here:" $local
    SudoDD
}

function SudoDD() {
    echo -e "Writing image in \033[01;32m$local \033[01;37m]..."
    sudo dd if=$local of=/dev$disk
    echo -e '\n\n\n'
    echo "Operation has been completed"
    echo "What you want to do?"
    read -p "[ 1 ] EXIT   /   [ 2 ] BACK : " $function
    case $function in
    1) exit ;;
    2) Menu ;;
    *) ;;
    esac
}

clear
Menu