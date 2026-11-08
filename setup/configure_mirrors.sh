#!/bin/bash
# Install my mirrors
sudo mv /etc/pacman.d/cachyos-v3-mirrorlist /etc/pacman.d/cachyos-v3-mirrorlist.backup
sudo mv /etc/pacman.d/cachyos-mirrorlist /etc/pacman.d/cachyos-mirrorlist.backup
sudo mv /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.backup
sudo cp ~/dotfiles/pacman_setup/mirrors/* /etc/pacman.d/
sudo cp ~/dotfiles/pacman_setup/pacman.conf /etc/pacman.conf
sudo rm -R /var/lib/pacman/sync
sudo pacman-key --init && sudo pacman-key --populate archlinux

# check the mirrors
bat /etc/pacman.conf | grep -A 2 mirror
bat /etc/pacman.d/cachyos-mirrorlist
bat /etc/pacman.d/cachyos-v3-mirrorlist
bat /etc/pacman.d/mirrorlist
bat /etc/pacman.d/core-mirrorlist
bat /etc/pacman.d/extra-mirrorlist

read -p "Check the mirror setup looks ok then press <enter> to reinstall everything'" </dev/tty

# Reinstall everything
sudo pacman -Sy
sudo pacman -Qnq | sudo pacman -S -
