#!/bin/sh
# DELETE FILES IF OLDER THAN

echo Current usage
du -sh /home/mike/backups/archive

find /home/mike/backups/archive -mtime +30 -exec rm {} \;

echo Usage now
du -sh /home/mike/backups/archive
