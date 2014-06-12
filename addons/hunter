#!/bin/bash
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
# Hunter finds web applications with Google then fingerprints them with WhatWeb
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
VERSION="0.1.2"
AUTHOR="Brendan Coles [ itsecuritysolutions.org ]"

# Hunter settings
VERBOSE="TRUE"
LIST=""
QUERY=""
APP=""
LOG="hunter.$(date +"%Y%m%d%H%M%S")-$$.log"

# WhatWeb settings
AGGRESSION="1"
USERAGENT="Mozilla/5.0 (iPhone; U; CPU iPhone OS 3_0 like Mac OS X; en-us) AppleWebKit/528.18 (KHTML, like Gecko) Version/4.0 Mobile/7A341"
PROXYUSER=""
PROXY=""
FILTER=""
WHATWEB_QUIET=""

# GGGoogleScan settings
WAIT="0"
DEPTH="5"
GSCAN_QUIET=""

# Check for WhatWeb in the current working directory
WHATWEB="./whatweb"
if [[ ! -e "$WHATWEB" ]]; then
	# Check for WhatWeb directory relative to hunter
	WHATWEB=`dirname $0`"/../whatweb"
	if [[ ! -e "$WHATWEB" ]]; then
		# Check if WhatWeb is installed
		WHATWEB=`which whatweb 2>/dev/null`
		if [[ -z "$WHATWEB" ]]; then
			echo "[!] Fatal Error: WhatWeb must be in the parent directory, in the current working directory or installed. Homepage: http://www.morningstarsecurity.com/research/whatweb"
			exit 1
		fi
	fi
fi


# expect gggooglescan to be in the addons/ folder
GOOGLESCAN=`dirname "$0"`"/gggooglescan"
if [[ ! -e "$GOOGLESCAN" ]]; then
	echo "[!] Fatal Error: Expected to find gggooglescan in `dirname`. Homepage: http://www.morningstarsecurity.com/research/gggooglescan"
	exit 1
fi


# Show usage and quit
function usage {

LRED="\033[1;32m"
DRED="\033[0;32m"
NOCOLOR="\033[0m"

echo -e "
$LRED         @@@  @@@   @@@  @@@   @@@  @@@   @@@@@@@   @@@@@@@@   @@@@@@@ 
$LRED         @@!  @@@   @@!  @@@   @@!@!@@@     @@!     @@!        @@!  @@@
$DRED         @!@!@!@!   @!@  !@!   @!@@!!@!     @!!     @!!!:!     @!@!!@! 
$DRED         !!:  !!!   !!:  !!!   !!:  !!!     !!:     !!:        !!: :!! 
$DRED          :   : :    :.:: :    ::    :       :      : :: :::    :   : :
$NOCOLOR
Hunter - Finds web applications with Google then fingerprints them with WhatWeb
Version $VERSION by $AUTHOR

Usage:   ./hunter [options]
Example: ./hunter -a wordpress
	 ./hunter -a wordpress -f "wordpress,title,httpserver"
	 ./hunter -g \"site:wordpress.org\" -f wordpress

Options:
  -g QUERY		Search Google for QUERY
  -a APPLICATION	Search Google for APPLICATION
  -f APPLICATION	Filter results by comma delimited list of applications
  -l KEYWORD		List supported applications. Filter by KEYWORD.
			Use \".\" to list all applications.
  -h			This help info
  -q			Quiet. Do not display comment lines and errors to STDOUT

Google Options:
  -d NUM		Depth of Google results. NUM pages to return. Default: 5
  -w SECONDS		Wait for SECONDS between each Google query. Default: 0

WhatWeb Options:
  -n AGGRESSION		Set WhatWeb aggression level. Default: 1 (passive)
  -u USER-AGENT		Set WhatWeb user agent
  -p <hostname:port>	Set WhatWeb proxy hostname and port
  -c <username[:pass]>	Set WhatWeb proxy credentials
"
}


# Command line options
while getopts 'd:a:u:f:w:n:g:l:p:c:qh' OPTION
do
 case $OPTION in
 h) usage; exit ;;
 d) DEPTH=$OPTARG ;;
 f) FILTER=$OPTARG ;;
 n) AGGRESSION=$OPTARG ;;
 u) USERAGENT=$OPTARG ;;
 w) WAIT=$OPTARG ;;
 q) VERBOSE="FALSE" ;;
 p) PROXY=$OPTARG ;;
 c) PROXYUSER=$OPTARG ;;
 l) LIST=$OPTARG ;;
 g) QUERY=$OPTARG ;;
 a) APP=$OPTARG ;;
 esac
done
shift $(($OPTIND -1 ))

# List applications
if [[ ! -z "$LIST" ]]; then
	if [[ "$VERBOSE" == "TRUE" ]]; then
		echo "[+] Listing applications matching \"$LIST\"" >&2
	fi
	"$WHATWEB" -I | grep "Dorks:" -B 5 | grep -E "^(\w)" | grep -i "$LIST"
	exit
fi

# Show usage when no arguments are provided
if [[ -z "$APP" && -z "$QUERY" ]]; then
	usage
        exit 1
fi

# Get dorks from WhatWeb if no Google query was provided
if [[ -z "$QUERY" ]]; then

	# Get dorks from WhatWeb
	if [[ "$VERBOSE" == "TRUE" ]]; then
		echo "[-] No query specified. Loading Google queries for $APP" >&2
	fi

	DORKS=`"$WHATWEB" --dorks "$APP"`

	# Quit if no dorks were returned
	if [[ -z "$DORKS" ]]; then
		if [[ "$VERBOSE" == "TRUE" ]]; then
			echo "[-] No Google queries were found." >&2
		fi
		exit 1
	fi

else
	DORKS="$QUERY"
fi

# Show google dorks
if [[ "$VERBOSE" == "TRUE" ]]; then
	echo "[+] Using the following Google queries:" >&2
	echo "$DORKS"
fi

# Set quiet args if required
if [[ "$VERBOSE" == "FALSE" ]]; then
	WHATWEB_QUIET="-q --no-errors"
	# gggooglescan's quiet mode is broken in v0.4
	if [[ ! -z `grep "getopts" "$GOOGLESCAN" | grep q` ]]; then
		GSCAN_QUIET="-q"
	fi
fi

# Pipe dorks to gggooglescan then pipe the results to WhatWeb
echo "$DORKS" | while read LINE ; do "$GOOGLESCAN" $GSCAN_QUIET -d "$DEPTH" -s "$WAIT" "$LINE"; done | egrep -v "^#" | "$WHATWEB" $WHATWEB_QUIET -a "$AGGRESSION" -U "$USERAGENT" -i /dev/stdin --proxy "$PROXY" --proxy-user "$PROXYUSER" --log-brief="$LOG" -p "$FILTER" | grep -e " \[[0-9]"

# Show log message
if [[ "$VERBOSE" == "TRUE" ]]; then
	echo "[+] Wrote output to $LOG" >&2
fi

