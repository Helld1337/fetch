#!/bin/bash

blue="\e[1;36m"
reset="\e[0m"

source /etc/os-release
arch=$(uname -m)
echo -e "${blue}OS${reset}: $NAME $arch"

vendor=$(cat /sys/class/dmi/id/sys_vendor)
product=$(cat /sys/class/dmi/id/product_name)
echo -e "${blue}Host${reset}: $vendor $product"

krnl=$(uname -r)
echo -e "${blue}Kernel${reset}: $krnl"

pacman=$(pacman -Qn | wc -l)
aur=$(yay -Qm | wc -l)
echo -e "${blue}Packages${reset}: $pacman pacman, $aur AUR"

term=$(echo $TERM)
echo -e "${blue}Terminal${reset}: $term"

shell=$(ps -p $PPID -o comm=)
echo -e "${blue}Shell${reset}: $shell"

wm=$(echo "$XDG_SESSION_TYPE")
echo -e "${blue}WM${reset}: $wm"

up=$(uptime -p | sed 's/up //')
echo -e "${blue}Uptime${reset}: $up"

install=$(stat -c %w / | cut -d' ' -f1)
echo -e "${blue}Install Date${reset}: $install"

cpu=$(grep -m 1 'model name' /proc/cpuinfo | cut -d: -f2)
echo -e "${blue}CPU${reset}:$cpu"

gpu=$(lspci | grep VGA | grep -o "Radeon.*" | cut -d'[' -f1 | sed 's/\]//' | sed 's/ (rev.*//')
echo -e "${blue}GPU${reset}: $gpu"

memory=$(free -m | awk '/Mem:/{printf "%.1fG / %.1fG (%.0f%%)", $3/1024, $2/1024, $3*100/$2}')
echo -e "${blue}Mem${reset}: $memory"

disk=$(df -h / | awk 'NR==2 {printf "%s / %s (%s)", $3, $2, $5}')
echo -e "${blue}Disk (/)${reset}: $disk"
