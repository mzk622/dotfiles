#!/bin/bash

#for kubectlx
deb [trusted=yes] http://ftp.de.debian.org/debian buster main
echo "run apt update..."
apt update

echo "run apt upgrade..."
apt upgrade

echo "run apt autoremove, autoclean..."
apt autoremove
apt autoclean

echo "run apt install..."
# Install `wget`
apt install -y wget

# Install more recent versions of some ubuntu tools.
apt install -y vim
apt install -y git
apt install -y build-essential
apt install -y snapd

# Install some CTF tools; see https://github.com/ctfs/write-ups.
apt install -y aircrack-ng
## binutils is install by build-essential
apt install -y binwalk
apt install -y cifer
apt install -y dex2jar
apt install -y dns2tcp
apt install -y fcrackzip
apt install -y foremost
apt install -y hydra-gtk
apt install -y john
apt install -y knockd
apt install -y netpbm
apt install -y nmap
apt install -y pngcheck
apt install -y socat
apt install -y sqlmap
apt install -y tcpflow
apt install -y tcpreplay
apt install -y tcptrace
apt install -y ucspi-tcp
apt install -y xz-utils

# Install other useful binaries.
apt install -y ack-grep
apt install -y bat
apt install -y direnv
apt install -y exa
apt install -y exiv2
apt install -y fd-find
apt install -y fish
apt install -y fzf
apt install -y git-lfs
apt install -y hexyl
apt install -y imagemagick
snap install -y p7zip-desktop
apt install -y peco
apt install -y pigz
apt install -y pv
snap install -y procs
apt install -y rename
snap install -y ripgrep
apt install -y rlwrap
snap install -y tree
apt install -y vbindiff

echo "run apt autoremove, autoclean..."
apt autoremove
apt autoclean