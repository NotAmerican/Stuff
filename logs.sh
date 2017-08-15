#!/bin/bash
for i in $(find /home -name "*.log" -type f -size +5M); do
	#rawr=$(ls -lh $i);
	#echo $rawr;
	sudo mv $i $i".0";
done
sudo service nginx reload
echo "Done!";
