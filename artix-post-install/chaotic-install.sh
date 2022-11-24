#!/bin/bash

if ! pacman -Qs artix-archlinux-support > /dev/null ; then
  echo "The package artix-archlinux-support is not installed."
  exit
fi

echo "Installing Required Keyrings..."

pacman-key --recv-key FBA220DFC880C036 --keyserver keyserver.ubuntu.com
pacman-key --lsign-key FBA220DFC880C036
pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst' 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'

echo "Adding Repo Lists..."

cat << "EOF" >> /etc/pacman.conf

# Chaotic AUR

[chaotic-aur]
Include = /etc/pacman.d/chaotic-mirrorlist

EOF

echo "Done!"
