#!/bin/bash
#this basically clones logrotate to allow for manual execution
for i in $(find /home -name "*.log" -type f -size +5M); do
	sudo mv $i $i".0";
done
sudo service nginx reload
echo "Done!";
