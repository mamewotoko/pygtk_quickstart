#! /bin/bash
set -e

UNAME=$(uname)

if [ "$UNAME" = Darwin ]; then
    brew update
    brew install pygobject3 gtk+3

elif [ -f /etc/lsb-release ]; then
    # debian, ubuntu
    sudo apt-get install -y python3 python3-dev python3-pip libgtk-3-dev

elif [[ "$UNAME" == "MINGW64_NT"* ]]; then
    # msys2 on PC
    pacman -Syu --noconfirm
    pacman -Sy --noconfirm mingw-w64-x86_64-gtk3 mingw-w64-x86_64-python3 mingw-w64-x86_64-python3-gobject 
    pacman -Sy --noconfirm mingw-w64-x86_64-python3-setuptools mingw-w64-x86_64-python3-pip

elif [[ "$UNAME" == "MSYS_NT"* ]]; then
    # travis
    $msys2 pacman -Syu --noconfirm
    $msys2 pacman -Sy --noconfirm mingw-w64-x86_64-gtk3 mingw-w64-x86_64-python3 mingw-w64-x86_64-python3-gobject 
    $msys2 pacman -Sy --noconfirm mingw-w64-x86_64-python3-setuptools mingw-w64-x86_64-python3-pip
else
    echo unsupported platform
    exit 1
fi
