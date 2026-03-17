#!/bin/sh

REPO="USERNAME/tr3000-immortal-prolite"
API="https://api.github.com/repos/$REPO/releases/latest"

echo "Checking update..."

URL=$(wget -qO- $API | grep browser_download_url | grep sysupgrade | cut -d '"' -f 4)

if [ -z "$URL" ]; then
    echo "No firmware found"
    exit 1
fi

echo "Backup..."
sysupgrade -b /root/backup.tar.gz

echo "Downloading..."
wget -O /tmp/fw.bin $URL

if [ ! -s /tmp/fw.bin ]; then
    echo "Download failed"
    exit 1
fi

echo "Upgrading..."
sysupgrade /tmp/fw.bin
