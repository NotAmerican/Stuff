#!/bin/bash
echo Creating cert for $1.
sudo letsencrypt certonly -a webroot --webroot-path=/var/www/html -d $1 -d www.$1
