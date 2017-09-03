#!/bin/sh

# (1) set up all the mysqldump variables
FILE=~/backups/$3_backup.sql.`date +"%Y%m%d"`
DBSERVER=odin.rtswv.com
DATABASE=$3
USER=$1
PASS=$2

# (2) in case you run this more than once a day, remove the previous version of the file
unalias rm     2> /dev/null
rm ${FILE}     2> /dev/null
rm ${FILE}.gz  2> /dev/null
# (3) do the mysql database backup (dump)

# use this command for a database server on a separate host:
mysqldump --opt --protocol=TCP --user=${USER} --password=${PASS} --host=${DBSERVER} ${DATABASE} > ${FILE}

#dump all databases
#mysqldump --opt --protocol=TCP --user=${USER} --password=${PASS} --host=${DBSERVER} --all-databases > ${FILE}
# use this command for a database server on localhost. add other options if need be.
#mysqldump --opt --user=${USER} --password=${PASS} ${DATABASE} > ${FILE}

# (4) gzip the mysql database dump file
gzip $FILE

# (5) show the user the result
echo "${FILE}.gz was created:"
ls -l ${FILE}.gz
