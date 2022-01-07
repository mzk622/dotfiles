#!/bin/bash

## for google chrome
echo "running install google chrome..."
sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
apt update
apt install google-chrome-stable

## for fcitx-mozc
echo "running install fcitx-mozc..."
apt -y install fcitx-mozc

## for discord
echo "running install discord..."
snap install discord

## for slack
echo "running install slack..."
snap install slack --classic

## for Tilix
echo "running install Tilix..."
add-apt-repository ppa:ubuntuhandbook1/tilix
apt install tilix

## for albert
echo "running install albert..."
curl https://build.opensuse.org/projects/home:manuelschneid3r/public_key | apt-key add -
sh -c "echo 'deb http://download.opensuse.org/repositories/home:/manuelschneid3r/xUbuntu_20.04/ /' > /etc/apt/sources.list.d/home:manuelschneid3r.list"
apt update
apt install albert

## for pycharm
echo "running install pycharm..."
snap install pycharm-educational --classic

## for goland
echo "running install goland..."
snap install goland --classic

## for datagrip
echo "running install datagrip..."
snap install datagrip --classic

## for webstorm
echo "running install webstorm..."
snap install webstorm --classic

## for Visual Studio Code
echo "running install Visual Studio Code..."
snap install code --classic

