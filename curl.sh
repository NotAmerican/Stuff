#!/bin/bash
response=$( curl -s -o /dev/null -w "%{http_code}" http://google.com/)
if [ $response != "302" ]; then
	mail -s "Script Test" mike@rtswv.com <<< "Google has returned an inproper status code."
fi
