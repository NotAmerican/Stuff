#!/bin/bash

if [ -z "$1" ]; then
  echo "You forgot your mysql username!"
else
#Move the current files in backup folder to archive folder.
mv ~/backups/* ~/backups/archive/ > /dev/null 2>&1

DBSERVER=odin.rtswv.com
USER=$1
PASS=$2
declare -a databases=('finalmile' 'infinitewp' 'masonrid_user' 'mjgrill' 'mjsaloon' 'nagios' 'short' 'steel' 'warriors_user' 'westover_user' 'wordpress' 'wp_band')
for database in ${databases[@]}
do
   FILE=~/backups/${database}_backup.sql.`date +"%Y%m%d"`
   DATABASE=${database}
   mysqldump --opt --protocol=TCP --user=${USER} --password=${PASS} --host=${DBSERVER} ${DATABASE} > ${FILE}
   gzip $FILE
   echo "${FILE}.gz was created."
done
fi



#dump all databases on remote host
#mysqldump --opt --protocol=TCP --user=${USER} --password=${PASS} --host=${DBSERVER} --all-databases > ${FILE}
# dump single database on local.
#mysqldump --opt --user=${USER} --password=${PASS} ${DATABASE} > ${FILE}
