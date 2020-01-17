#! /bin/sh
if [ "$(uname)" = Darwin ]; then
    brew install pygobject3 gtk+3
elif [ -f /etc/lsb-release ]; then
    # debian, ubuntu
    sudo apt install -y python3 python3-dev python3-pip libgtk-3-dev
else
    echo unsupported platform
    exit 1
fi
