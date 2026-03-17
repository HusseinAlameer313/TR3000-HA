#!/bin/sh

REPO="USERNAME/tr3000-immortal-prolite"
API="https://api.github.com/repos/$REPO/releases/latest"

URL=$(wget -qO- $API | grep browser_download_url | grep sysupgrade | cut -d '"' -f 4)

sysupgrade -b /root/backup.tar.gz
wget -O /tmp/fw.bin $URL
sysupgrade /tmp/fw.bin
