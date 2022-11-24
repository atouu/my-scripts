#!/bin/bash

# Adding Universe Repo

if ! grep -q "\[universe\]" /etc/pacman.conf; then

echo "Adding Universe Repo..."

cat << "EOF" >> /etc/pacman.conf

# Universe Repo

[universe]
Server = https://universe.artixlinux.org/$arch
Server = https://mirror1.artixlinux.org/universe/$arch
Server = https://mirror.pascalpuffke.de/artix-universe/$arch
Server = https://artixlinux.qontinuum.space/artixlinux/universe/os/$arch
Server = https://mirror1.cl.netactuate.com/artix/universe/$arch
Server = https://ftp.crifo.org/artix-universe/

EOF
  
fi

sleep 5

#-----------#

echo "Installing Arch Support..."

pacman -Syu --needed artix-archlinux-support

if ! grep -q "mirrorlist-arch" /etc/pacman.conf; then

echo "Adding Arch Repo Lists..."

cat << "EOF" >> /etc/pacman.conf

# Archlinux Repos

#[testing]
#Include = /etc/pacman.d/mirrorlist-arch

[extra]
Include = /etc/pacman.d/mirrorlist-arch

#[community-testing]
#Include = /etc/pacman.d/mirrorlist-arch

[community]
Include = /etc/pacman.d/mirrorlist-arch

#[multilib-testing]
#Include = /etc/pacman.d/mirrorlist-arch

#[multilib]
#Include = /etc/pacman.d/mirrorlist-arch

EOF

fi

echo "Done!"
