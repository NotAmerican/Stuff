#!/bin/bash
echo Creating cert for $1.
sudo certbot certonly --dns-digitalocean --dns-digitalocean-credentials /home/mike/do.txt -d $1 -d *.$1
