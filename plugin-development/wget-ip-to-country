#!/bin/sh
##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
#  wget-ip-to-country
#  - Download and extract IpToCountry.csv from http://software77.net/geo-ip/
#    and move to ../plugins/IpToCountry.csv
#  - Requires: wget and unzip
#  - Written by : Brendan Coles <bcoles@gmail.com> 2011-03-21
##

# Check if unzip is installed
UNZIP=`which unzip 2>/dev/null`
if [[ -z $UNZIP ]]; then
	echo "[*] Fatal Error: unzip is not installed - Aborting..."
	exit 1
fi

# Check if wget is installed
WGET=`which wget 2>/dev/null`
if [[ -z $WGET ]]; then
	echo "[*] Fatal Error: wget is not installed - Aborting..."
	exit 1
fi

# Download
echo "[*] Downloading: http://software77.net/geo-ip/?DL=2&x=Download"
wget "http://software77.net/geo-ip/?DL=2&x=Download" -O geo-ip.zip && unzip geo-ip.zip && rm geo-ip.zip

# Check if IpToCountry.csv was extracted
if [[ -f "IpToCountry.csv" ]]; then
	echo "[*] Moving: IpToCountry.csv to ../plugins/IpToCountry.csv"
	mv IpToCountry.csv ../plugins/IpToCountry.csv
else
	echo "[*] Fatal Error: IpToCountry.csv does not exist - Aborting..."
	exit 1
fi

# Check if IpToCountry.csv was moved
if [[ -f "../plugins/IpToCountry.csv" ]]; then
	echo "[*] Wrote: ../plugins/IpToCountry.csv"
else
	echo "[*] Fatal Error: Failed to move IpToCountry.csv to ../plugins/IpToCountry.csv - Aborting..."
	exit 1
fi

