#!/bin/bash
if [ -z "$1" ] || [ -z "$2" ]; then
  echo "one or both are empty."
else

echo Creating wordpress files and database for $1.

wget https://wordpress.org/latest.tar.gz
tar -xvf latest.tar.gz -C /home/$1/html
mv /mnt/volume1/www/$1/html/wordpress/* /mnt/volume1/www/$1/html
rmdir /mnt/volume1/www/$1/html/wordpress
rm -rf latest.tar.gz
chown $1:$1 -R /mnt/volume1/www/$1/html

password=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9-_!@#$' | fold -w 12 | head -n 1)
mysql -umike -h odin.rtswv.com -p$2 -e "CREATE USER '$1'@'%' IDENTIFIED BY '$password';"
mysql -umike -h odin.rtswv.com -p$2 -e "CREATE DATABASE IF NOT EXISTS $1;"
mysql -umike -h odin.rtswv.com -p$2 -e "GRANT ALL PRIVILEGES ON $1.* TO '$1'@'%';"
mysql -umike -h odin.rtswv.com -p$2 -e "FLUSH PRIVILEGES;"
echo Mysql password is $password;

echo Hopefully everything is good?

fi
