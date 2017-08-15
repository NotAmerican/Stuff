#!/bin/bash
echo Adding user $1.

adduser --disabled-password -gecos "" $1 || { exit 1; }
mkdir -p /mnt/volume1/www/$1/html || { exit 1; }
chown $1:$1 /mnt/volume1/www/$1/html || { exit 1; }
chmod g+s /mnt/volume1/www/$1/html || { exit 1; }
ln -s /mnt/volume1/www/$1/html /home/$1/html || { exit 1; }
