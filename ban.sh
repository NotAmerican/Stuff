#!/bin/bash
if [ -z "$1" ]; then
  echo "Please provide an IP address."
else

echo Banning $1.

sudo iptables -A INPUT -s $1 -j DROP

echo IP address $1 is now banned.

fi
