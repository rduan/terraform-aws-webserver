#!/bin/bash
WEB_SERVER_ADDR=54.211.152.253

while true; do
		echo "Checking health of $WEB_SERVER_ADDR"
		curl -s -o /dev/null -w "%{http_code}" $WEB_SERVER_ADDR
		echo
		sleep 5
done
