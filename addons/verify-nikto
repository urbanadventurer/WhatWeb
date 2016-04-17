#!/bin/bash
# Verify Nikto logs
# Copyright 2014, Andrew Horton 
VERSION=0.1b
 
if [ -z "$1" ]; then
echo "Usage: $0 <nikto-log>"
echo "Version: $VERSION"
echo "Verifies Nikto logs using WhatWeb to separate false positives / true positives"
exit 1
fi
fname="$1"
 
if [ ! -f "$fname" ]; then
echo "Cannot read $fname"
exit 1
fi
 
tfile=`tempfile --prefix=verify-nikto-`
tlog=`tempfile --prefix=whatweb-log-`
grep -A 999999 "Start Time:" "$fname" | egrep -o "^+.*(/[^:]+)" | cut -d/ -f 2-|cut -d: -f 1| sed 's/^/\//g' > "$tfile"
hostname=`egrep "+ Target (Host|Hostname): " "$fname" | cut -d : -f2 | tr -d ' '`
port=`grep "+ Target Port: " "$fname"|  cut -d : -f2 | tr -d ' '`
 
if grep -q 'SSL Info' "$fname"; then
prefix='https://'
else
prefix='http://'
fi

echo "------------------------------------------------------------------------------------------------"
echo "Checking Nikto Log: $fname"
echo "Running whatweb on $prefix$hostname:$port with `wc -l $tfile` url paths"
whatweb --log-brief "$tlog" -p+ -i $tfile --url-prefix "$prefix$hostname:$port" > /dev/null 2>/dev/null
echo
echo "Different HTML Tag Hashes"
echo "------------------------------"
egrep -o "Tag-Hash[^ ]+" $tlog|sort -u
 
echo "Plugin analysis"
echo -e "Count\tPlugin"
echo "------------------------------"
egrep -o "[^ ]+\[" "$tlog" |sort|uniq -c | sort -rn
 
echo -e "WhatWeb log: $tlog\nURL path list: $tfile\n"
