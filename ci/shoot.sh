#! /bin/sh
if [ ! -f /etc/lsb-release ]; then
    exit
fi

curl -u $AUTH -fsSLO https://mamewo.ddo.jp/private/gdrive
chmod +x gdrive
curl -fsSLO https://raw.githubusercontent.com/mamewotoko/xvfb-screenshooter/master/xvfb-screenshooter.sh
chmod +x xvfb-screenshooter.sh
./xvfb-screenshooter.sh timeout 10s ./main.py

# 
sh ci/upload.sh
