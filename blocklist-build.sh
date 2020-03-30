#!/bin/sh
curl -s -A "Mozilla/5.0 (X11; Linux x86_64; rv:74.0) Gecko/20100101 Firefox/74.0" https://www.iblocklist.com/lists.php | sed -n "s/.*value='\(http.*\)'.*/\1/p" | sed "s/\&amp;/\&/g" | sed "s/http/\"http/g" | sed "s/gz/gz\"/g" | xargs wget -O - |  gunzip | egrep -v '^#' | gzip > blocklist.gz
