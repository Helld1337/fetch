#!/bin/bash

purple="\e[1;35m
reset="\e[0m"

source /etc/os-release
arch=$(uname -m)
echo -e "${purple}OS${reset}: $NAME $arch"

vendor=$(cat /sys/class/dmi/id/sys_vendor)
product=$(cat /sys/class/dmi/id/product_name)
echo -e "${purple}Host${reset}: $vendor $product"

krnl=$(uname -r)
echo -e "${purple}Kernel${reset}: $krnl"

term=$(echo $TERM)
echo -e "${purple}Terminal${reset}: $term"

shell=$(ps -p $PPID -o comm=)
echo -e "${purple}Shell${reset}: $shell"

wm=$(echo "$XDG_SESSION_TYPE")
echo -e "${purple}WM${reset}: $wm"

install=$(stat -c %w / | cut -d' ' -f1)
echo -e "${purple}Install Date${reset}: $install"

cpu=$(grep -m 1 'model name' /proc/cpuinfo | cut -d: -f2)
echo -e "${purple}CPU${reset}:$cpu"
