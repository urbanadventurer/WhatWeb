#!/bin/bash
# country scanner v1.1
# Illustrative example of how to write scripts using whatweb and nmap.
# Automatically discover samples of web servers and test whatweb
#


GRAY="\033[1;30m"
RED="\033[0;31m"
LIGHT_RED="\033[1;31m"
GREEN="\033[0;32m"
LIGHT_GRAY="\033[0;37m"
CYAN="\033[0;36m"
LIGHT_CYAN="\033[1;36m"
DARK_GREY="\033[1;30m"
BROWN="\033[0;33m"
WHITE="\033[1;37m"
BLUE="\033[0;34m"
LIGHT_BLUE="\033[1;34m"
NO_COLOUR="\033[0m"
SUBTITLE=$DARK_GREY

echo -e "
$LIGHT_RED                            __                  
  ____   ____  __ __  _____/  |________  ___.__.$RED
_/ ___\ /    \|  |  \/    \   __\_  __ \\\\\   |  |
\  \___(  //  )  |  /   |  \  |  |  | \/ \___  |
 \_____>\____/|____/|___|  /__|  |__|    / ____|
                         \/              \/                                                          
$LIGHT_BLUE  ______  ____  _____     ____   ____   ____ _______ $BLUE
 /  ___/_/ ___\ \__  \   /    \ /    \_/ __ \\\\\_  __ \\
 \___ \ \  \___  / \\\\\ \_|   |  \   |  \  ___/ |  | \/
/______> \___  >(____  /|___|  /___|  /\_____>|__|   
             \/      \/      \/     \/           $NO_COLOUR

Country Scanner - Sample the web around the world	
Version v1.1 by urbanadventurer
"

N=1000
SCANBLOCK=10000
AGENT="Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; SLCC1; .NET CLR 2.0.50727; eSobiSubscriber 2.0.4.16; .NET CLR 3.0.30618)"

usage(){
	echo "Usage: $0 "
	echo -e "-c\tCountry"
	echo -e "-l\tList countries"
	echo -e "-h\tHelp"
	echo -e "-n\tNumber of whatweb log entries. Default: $N"
	echo
}

checkdependencies(){
for c in `echo "nmap geoipgen"`;
do
	if [ -z "`which $c`" ]; then
		echo "$c not found. Aborting"
		echo "You need to install geoipgen to generate country IP lists"
		echo "Visit http://www.morningstarsecurity.com/research/geoipgen"
		exit 1
	fi
done
}

checkdependencies

while getopts "hln:c:" OPTION
do
	case $OPTION in
	h)	usage;exit 1;;
	n)	N="$OPTARG";;
	l)	geoipgen -l;exit 1;;
	c)	CC="$OPTARG";;
	?)	usage; exit ;;
	esac
done

if [ -z "$CC" ]; then
	usage; exit 1
fi

# check CC is sane

# find whatweb
WHATWEB=`dirname "$0"`"/../whatweb"
FOUND=0

f=`tempfile -d . --prefix scan- --suffix -geo`
g=`tempfile -d . --prefix scan- --suffix -nmp`
h=`tempfile -d . --prefix scan- --suffix "-$CC"`

echo "Scan of $CC started at `date`"
echo "--------------------------------------------------"
echo

while [ "$FOUND" -le "$N" ]; do

	echo "[*] Generating $SCANBLOCK IP addresses in $CC"
	echo "    geoipgen -n \"$SCANBLOCK\" \"$CC\" > \"$f\""
	geoipgen -n "$SCANBLOCK" "$CC" > "$f"
	echo

	echo "[*] Port scanning for web servers"
	echo "    nmap  --open -PN -n -p 80 -i \"$f\" -oG \"$g\" --max-retries 1 --max-rtt-timeout 30s --min-hostgroup 4096 --host-timeout 30s > /dev/null 2>/dev/null"
	nmap  --open -PN -n -p 80 -i "$f" -oG "$g" --max-rtt-timeout 10s --min-hostgroup 4096 --host-timeout 10s > /dev/null 2>/dev/null 
	echo
	fgrep open "$g"  | cut -d ' ' -f 2 > "$f"

	#rm -f "$g"
	echo "[*] Found "`wc -l "$f" |cut -d ' ' -f 1`" IPs with TCP port 80 open"
	echo
	echo "[*] Scanning with WhatWeb. Logging to $h"
	# -p +  
	echo "    $WHATWEB --no-errors -U \"$AGENT\" -t 500 --read-timeout 30 --log-brief \"$h\" -i \"$f\""
	$WHATWEB --no-errors -U "$AGENT" -t 50 --log-brief "$h" -i "$f" 
	echo
	FOUND=`wc -l "$h" | cut -d ' ' -f 1`
	#rm -f "$f"
	echo "[*] Found $FOUND web servers so far"
	echo
done

echo "[*] Finished at `date`"

rm -f "$f" "$g"

