#!/bin/bash
response=$( curl -s -o /dev/null -w "%{http_code}" http://wvnet.edu/)
if [ $response != "302" ]; then
	mail -s "Script Test" @email.uscc.net <<< "SteelTown is broken again"
fi
