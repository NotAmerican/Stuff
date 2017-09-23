#!/bin/bash
basedir="/mnt/volume1/www"
for dir in $(find "$basedir" -mindepth 1 -maxdepth 1 -type d); do
	sudo tar -czf "$dir.tar.gz" "$dir" > /dev/null 2>&1
	sudo mv $dir.tar.gz /home/mike/websites/
	echo "$dir has been zipped."
done
