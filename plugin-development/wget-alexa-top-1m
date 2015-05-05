#!/bin/sh
##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
#  wget-alexa-top-1m
#  - Download and extract the Alexa top one million domains in newline format
#    and write alexa-top-1m.txt, alexa-top-1000.txt and alexa-top-100.txt
#  - Requires: wget and unzip
#  - Written by : Brendan Coles <bcoles@gmail.com> 2011-01-25
##

# Check if unzip is installed
UNZIP=`which unzip 2>/dev/null`
if [ -z "$UNZIP" ]; then
	echo "[*] Fatal Error: unzip is not installed - Aborting..."
	exit 1
fi

# Check if wget is installed
WGET=`which wget 2>/dev/null`
if [ -z "$WGET" ]; then
	echo "[*] Fatal Error: wget is not installed - Aborting..."
	exit 1
fi

# Download
echo "[*] Downloading: http://s3.amazonaws.com/alexa-static/top-1m.csv.zip"
wget "http://s3.amazonaws.com/alexa-static/top-1m.csv.zip" && unzip top-1m.csv.zip && rm top-1m.csv.zip

# Check if top-1m.csv was extracted
if [ -f "top-1m.csv" ]; then
	echo "[*] Formatting: top-1m.csv"
	cut -d, -f2- top-1m.csv > alexa-top-1m.txt
else
	echo "[*] Fatal Error: top-1m.csv does not exist - Aborting..."
	exit 1
fi

# Check if alexa-top-1m.txt was created
if [ -f "alexa-top-1m.txt" ]; then
	echo "[*] Wrote: alexa-top-1m.txt"
	head -n 1000 alexa-top-1m.txt > alexa-top-1000.txt
	echo "[*] Wrote: alexa-top-1000.txt"
	head -n 100 alexa-top-1m.txt > alexa-top-100.txt
	echo "[*] Wrote: alexa-top-100.txt"
	head -n 10 alexa-top-1m.txt > alexa-top-10.txt
	echo "[*] Wrote: alexa-top-10.txt"
else
	echo "[*] Fatal Error: alexa-top-1m.txt does not exist - Aborting..."
	exit 1
fi

