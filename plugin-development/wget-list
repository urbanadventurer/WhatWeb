#!/bin/bash

AGENT="Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.9.0.12) Gecko/2009070811 Ubuntu/9.04 (jaunty) Firefox/3.0.12"

if [ -z $1 ]; then
 echo "Usage: $0 <file with list of urls>"
 echo "downloads each URL's html and headers into the current directory"
 exit
fi


for i in `cat $1` ; do
 u=$i; f=`echo $i | sed 's/http:\/\///g' | sed 's/\//-/g'`
# wget -U "$AGENT" -t 2 -O $f.html $u
# curl -A "$AGENT" -I $u > $f.meta
 curl -A "$AGENT" -k -i $u > $f.http
done

