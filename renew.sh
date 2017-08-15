#!/bin/bash
echo Renewing certs.
sudo letsencrypt renew
sudo service nginx restart
