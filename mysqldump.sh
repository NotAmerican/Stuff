#!/bin/sh

# (1) set up all the mysqldump variables
FILE=~/backups/$3_backup.sql.`date +"%Y%m%d"`
DBSERVER=odin.rtswv.com
DATABASE=$3
USER=$1
PASS=$2

# Delete old files.
unalias rm     2> /dev/null
rm ${FILE}     2> /dev/null
rm ${FILE}.gz  2> /dev/null

# dump database on remote host:
mysqldump --opt --protocol=TCP --user=${USER} --password=${PASS} --host=${DBSERVER} ${DATABASE} > ${FILE}

#dump all databases on remote host
#mysqldump --opt --protocol=TCP --user=${USER} --password=${PASS} --host=${DBSERVER} --all-databases > ${FILE}

# dump single database on local.
#mysqldump --opt --user=${USER} --password=${PASS} ${DATABASE} > ${FILE}

# gzip the file
gzip $FILE

# tell me you created a file.
echo "${FILE}.gz was created:"
ls -l ${FILE}.gz
