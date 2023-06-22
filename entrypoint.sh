#!/bin/bash

set -e

mkdir -p /var/www/html/ubuntu

# apt-mirror /etc/apt/mirror.list

# add local deb packages
for deb in /debs/*.deb; do
  reprepro -b /var/www/html/ubuntu includedeb focal $deb
done

# ln -s /var/spool/apt-mirror/mirror/archive.ubuntu.com/ubuntu /var/www/html/ubuntu

apache2ctl -D FOREGROUND
