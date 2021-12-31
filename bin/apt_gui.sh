#!/bin/bash

## for google chrome
sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
apt update
apt install google-chrome-stable

## for fcitx-mozc
apt -y install fcitx-mozc

## for discord
snap install discord

## for slack
snap install slack --classic

## for Tilix
add-apt-repository ppa:ubuntuhandbook1/tilix
apt install tilix

## for albert
curl https://build.opensuse.org/projects/home:manuelschneid3r/public_key | apt-key add -
sh -c "echo 'deb http://download.opensuse.org/repositories/home:/manuelschneid3r/xUbuntu_20.04/ /' > /etc/apt/sources.list.d/home:manuelschneid3r.list"
apt update
apt install albert

## for pycharm
snap install pycharm-educational --classic

## for goland
snap install goland --classic

## for datagrip
snap install datagrip --classic

## for webstorm
snap install webstorm --classic

## for Visual Studio Code
snap install code --classic

