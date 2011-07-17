#!/bin/bash
# gggooglescan - Enumerate hostnames and URLs from Google.
# Features: antibot avoidance, search within a country, custom search appliance, horizontal searching
#
# By Andrew Horton aka urbanadventurer, Security-Assessment.com
# Homepage: www.morningstarsecurity.com/research/
# License: GPLv3
# Version o.5, o7/2011
#
# Usage Notes:
# GOOGLE=210.55.180.157  <-- this IP is within New Zealand
# Be careful not to get banned
#

function list_useragents {
	for ((i=0; i<${#AGENTS[@]}; i+=1 )) { # do
		echo [$i] ${AGENTS[i]};
	}
}

function set_agent() {
	if [[ "$1" =~ ^[0-9]+$ ]] ; then
		AGENT=${AGENTS[$1]}
	else
		AGENT="$1"
	fi
}


AGENTS=(
"Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; SLCC1; .NET CLR 2.0.50727; eSobiSubscriber 2.0.4.16; .NET CLR 3.0.30618)"
"Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.2; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729)"
"Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; InfoPath.2; .NET CLR 2.0.50727; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729; .NET CLR 1.1.4322)"
"Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US; rv:1.9.2.11) Gecko/20101012 Firefox/3.6.11"
"Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; GTB6.6)"
"Mozilla/5.0 (Windows; U; Windows NT 5.1; en-GB; rv:1.9.1.5) Gecko/20091102 Firefox/3.5.5 (.NET CLR 3.5.30729)"
"Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0; Trident/4.0; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; .NET CLR 3.5.30729; .NET CLR 3.0.30618)"
"Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US) AppleWebKit/533.4 (KHTML, like Gecko) Chrome/5.0.375.127 Safari/533.4"
"Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US) AppleWebKit/534.7 (KHTML, like Gecko) Chrome/7.0.517.41 Safari/534.7"
"Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; .NET CLR 3.5.30729; .NET CLR 3.0.30618; OfficeLiveConnector.1.3; OfficeLivePatch.0.0)"
"Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; .NET CLR 2.0.50727; .NET CLR 1.1.4322; InfoPath.2; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729)"
"Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0; Trident/4.0; SLCC1; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30618; .NET4.0C)"
"Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_6_1; en-us) AppleWebKit/531.9 (KHTML, like Gecko) Version/4.0.3 Safari/531.9"
"Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US) AppleWebKit/532.5 (KHTML, like Gecko) Chrome/4.1.249.1064 Safari/532.5"
"Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.9.1.5) Gecko/20091102 Firefox/3.5.5 (.NET CLR 3.5.30729)"
"Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_6_2; en-us) AppleWebKit/531.21.8 (KHTML, like Gecko) Version/4.0.4 Safari/531.21.10"
"Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729)"
"Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.9.2) Gecko/20100115 Firefox/3.6"
"Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.9.2.8) Gecko/20100723 Ubuntu/10.04 (lucid) Firefox/3.6.8 GTB7.1"
"Mozilla/5.0 (Windows NT 5.1; rv:2.0) Gecko/20100101 Firefox/4.0"
"Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US) AppleWebKit/533.4 (KHTML, like Gecko) Chrome/5.0.375.99 Safari/533.4"
"Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US) AppleWebKit/534.16 (KHTML, like Gecko) Chrome/10.0.648.204 Safari/534.16"
"Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_6_4; en-us) AppleWebKit/533.16 (KHTML, like Gecko) Version/5.0 Safari/533.16"
"Mozilla/5.0 (Windows; U; Windows NT 5.1; en-GB; rv:1.9.1.7) Gecko/20091221 Firefox/3.5.7 (.NET CLR 3.5.30729)"
"Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.9.2.12) Gecko/20101026 SUSE/3.6.12-0.6.1 Firefox/3.6.12"
"Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_4_11; en) AppleWebKit/531.9 (KHTML, like Gecko) Version/4.0.3 Safari/531.9"
"Mozilla/5.0 (Windows; U; Windows NT 6.0; en-US) AppleWebKit/534.7 (KHTML, like Gecko) Chrome/7.0.517.41 Safari/534.7"
"Mozilla/5.0 (Windows; U; Windows NT 6.1; en-GB; rv:1.9.2.10) Gecko/20100914 Firefox/3.6.10"
"Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; WOW64; SLCC1; .NET CLR 2.0.50727; InfoPath.1; .NET CLR 3.5.30729; .NET CLR 3.0.30618)"
"Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729)"
"Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_5_8; en-us) AppleWebKit/533.18.1 (KHTML, like Gecko) Version/5.0.2 Safari/533.18.5"
"Mozilla/5.0 (Windows; U; Windows NT 5.1; en-GB; rv:1.9.2.3) Gecko/20100401 Firefox/3.6.3 (.NET CLR 3.5.30729)"
"Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US; rv:1.9.1.5) Gecko/20091102 Firefox/3.5.5"
"Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US; rv:1.9.2.3) Gecko/20100401 Firefox/3.6.3"
"Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US; rv:1.9.2.13) Gecko/20101203 Firefox/3.6.13"
"Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.1.4322; .NET CLR 2.0.50727; InfoPath.1)"
"Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.04506.30; .NET CLR 3.0.04506.648; InfoPath.2)"
"Mozilla/5.0 (Windows; U; Windows NT 6.0; en-GB; rv:1.9.2) Gecko/20100115 Firefox/3.6 (.NET CLR 3.5.30729)"
"Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US) AppleWebKit/532.0 (KHTML, like Gecko) Chrome/3.0.195.38 Safari/532.0"
"Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US) AppleWebKit/533.4 (KHTML, like Gecko) Chrome/5.0.375.70 Safari/533.4"
"Mozilla/5.0 (Windows; U; Windows NT 5.1; en-GB; rv:1.9.2.12) Gecko/20101026 Firefox/3.6.12"
"Mozilla/5.0 (Windows; U; Windows NT 5.1; en-GB; rv:1.9.2.3) Gecko/20100401 Firefox/3.6.3"
"Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0; SLCC1; .NET CLR 2.0.50727; .NET CLR 3.0.04506; .NET CLR 1.1.4322; Tablet PC 2.0)"
"Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.9.2.13) Gecko/20101206 Ubuntu/10.04 (lucid) Firefox/3.6.13 GTB7.1"
"Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.9.2.10) Gecko/20100914 Firefox/3.6.10 ( .NET CLR 3.5.30729)"
"Mozilla/5.0 (Windows; U; Windows NT 6.1; en-GB; rv:1.9.2.13) Gecko/20101203 Firefox/3.6.13"
"Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0; Trident/4.0; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; .NET CLR 3.5.30729; .NET CLR 3.0.30729; .NET4.0C)"
"Mozilla/5.0 (Windows; U; Windows NT 6.0; en-US) AppleWebKit/532.0 (KHTML, like Gecko) Chrome/3.0.195.27 Safari/532.0"
"Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US) AppleWebKit/534.10 (KHTML, like Gecko) Chrome/8.0.552.215 Safari/534.10"
"Mozilla/5.0 (Windows; U; Windows NT 5.1; en-GB; rv:1.9.0.19) Gecko/2010031422 Firefox/3.0.19"
"Mozilla/5.0 (Macintosh; U; PPC Mac OS X 10_4_11; en) AppleWebKit/533.19.4 (KHTML, like Gecko) Version/4.1.3 Safari/533.19.4"
"Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; WOW64; Trident/4.0; GTB6.6; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; HPDTDF; .NET4.0C)"
"Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.9.2.3) Gecko/20100401 Firefox/3.6.3 ( .NET CLR 3.5.30729)"
"Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0; Trident/4.0; SLCC1; .NET CLR 2.0.50727; Media Center PC 5.0; .NET CLR 3.5.30729; .NET CLR 3.0.30729)"
"Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_5_8; en-us) AppleWebKit/531.22.7 (KHTML, like Gecko) Version/4.0.5 Safari/531.22.7"
"Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US) AppleWebKit/534.7 (KHTML, like Gecko) Chrome/7.0.517.44 Safari/534.7"
"Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.9.1.7) Gecko/20091221 Firefox/3.5.7 (.NET CLR 3.5.30729)"
"Mozilla/5.0 (Windows; U; Windows NT 5.1; en-GB; rv:1.9.0.3) Gecko/2008092417 Firefox/3.0.3 (.NET CLR 3.5.30729)"
"Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US) AppleWebKit/533.4 (KHTML, like Gecko) Chrome/5.0.375.99 Safari/533.4"
"Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0)"
"Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.1.4322)"
"Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US) AppleWebKit/534.7 (KHTML, like Gecko) Chrome/7.0.517.44 Safari/534.7"
"Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US; rv:1.9.2.3) Gecko/20100401 Firefox/3.6.3"
"Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_5_8; en-us) AppleWebKit/531.9 (KHTML, like Gecko) Version/4.0.3 Safari/531.9"
"Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US) AppleWebKit/534.3 (KHTML, like Gecko) Chrome/6.0.472.63 Safari/534.3"
"Mozilla/5.0 (Windows; U; Windows NT 6.1; en-GB; rv:1.9.2.8) Gecko/20100722 Firefox/3.6.8"
"Mozilla/5.0 (Windows; U; Windows NT 6.1; en-GB; rv:1.9.2.12) Gecko/20101026 Firefox/3.6.12"
"Mozilla/4.0 (compatible; MSIE 5.01; Windows NT 5.0)"
"Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.1.4322; .NET CLR 2.0.50727)"
"Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_6_6; en-us) AppleWebKit/533.19.4 (KHTML, like Gecko) Version/5.0.3 Safari/533.19.4"
"Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US; rv:1.9.2.7) Gecko/20100713 Firefox/3.6.7"
"Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.9.1.5) Gecko/20091102 Firefox/3.5.5"
"Mozilla/5.0 (X11; U; Linux i686; en-US) AppleWebKit/532.3 (KHTML, like Gecko) Chrome/4.0.223.11 Safari/532.3"
"Mozilla/5.0 (Windows; U; Windows NT 6.0; en-GB; rv:1.9.2.8) Gecko/20100722 Firefox/3.6.8"
"Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US; rv:1.9.2.12) Gecko/20101026 Firefox/3.6.12"
"Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; Tablet PC 2.0; InfoPath.3)"
"Mozilla/5.0 (Windows; U; Windows NT 6.1; en-GB; rv:1.9.2.3) Gecko/20100401 Firefox/3.6.3"
"Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.9.2.3) Gecko/20100401 Firefox/3.6.3"
"Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_5_8; en-us) AppleWebKit/533.16 (KHTML, like Gecko) Version/5.0 Safari/533.16"
"Opera/9.80 (X11; Linux i686; U; en) Presto/2.2.15 Version/10.00"
"Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_6_4; en-us) AppleWebKit/533.18.1 (KHTML, like Gecko) Version/5.0.2 Safari/533.18.5"
"Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_5_6; en-us) AppleWebKit/525.27.1 (KHTML, like Gecko) Version/3.2.1 Safari/525.27.1"
"Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US) AppleWebKit/534.10 (KHTML, like Gecko) Chrome/8.0.552.224 Safari/534.10"
"Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; GTB6.4; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729)"
"Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; .NET CLR 1.1.4322)"
"Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.9.2.12) Gecko/20101026 Firefox/3.6.12"
"Mozilla/4.0 (compatible; MSIE 7.0;Windows NT 5.1;.NET CLR 1.1.4322;.NET CLR 2.0.50727;.NET CLR 3.0.04506.30)"
"Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 2.0.50727; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729)"
"Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; .NET CLR 2.0.50727; .NET CLR 1.1.4322; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729; InfoPath.2)"
"Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; WOW64; Trident/4.0; GTB0.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; HPDTDF)"
"Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US; rv:1.9.2.3) Gecko/20100401 Firefox/3.6.3"
"Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_5_8; en-us) AppleWebKit/531.21.8 (KHTML, like Gecko) Version/4.0.4 Safari/531.21.10"
"Mozilla/5.0 (Macintosh; U; PPC Mac OS X 10_4_11; en) AppleWebKit/533.18.1 (KHTML, like Gecko) Version/4.1.2 Safari/533.18.5"
"Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.9.2.13) Gecko/20101203 Firefox/3.6.13"
"Mozilla/5.0 (Windows; U; Windows NT 6.0; en-US; rv:1.9.1.16) Gecko/20101130 Firefox/3.5.16 ( .NET CLR 3.5.30729)"
"Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.9.2.10) Gecko/20100915 Ubuntu/10.04 (lucid) Firefox/3.6.10 GTB7.1"
"Mozilla/5.0 (Windows; U; Windows NT 6.0; en-GB; rv:1.9.1.3) Gecko/20090824 Firefox/3.5.3 (.NET CLR 3.5.30729)"
"Mozilla/5.0 (Windows; U; Windows NT 5.1; en-GB; rv:1.8.1.6) Gecko/20070725 Firefox/2.0.0.6"
"Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0)"
"Mozilla/5.0 (Windows; U; Windows NT 5.1; zh-CN; rv:1.9.2.3) Gecko/20100401 Firefox/3.6.3"
"Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; GTB6; InfoPath.2; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729)"
"Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1)"
"Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729)"
"Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; SV1; .NET CLR 2.0.50727)"
"Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.0; Trident/4.0; SLCC1; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729)"
"Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; .NET CLR 2.0.50727; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729)"
"Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; InfoPath.2; .NET CLR 2.0.50727; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729)"
"Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.9.0.15) Gecko/2009102814 Ubuntu/8.10 (intrepid) Firefox/3.0.15"
"Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; .NET CLR 1.1.4322; .NET CLR 2.0.50727; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729)"
"Mozilla/5.0 (Windows; U; Windows NT 6.0; en-GB; rv:1.9.2.3) Gecko/20100401 Firefox/3.6.3 (.NET CLR 3.5.30729)"
"Mozilla/5.0 (Windows; U; Windows NT 6.0; en-GB; rv:1.9.1.4) Gecko/20091016 Firefox/3.5.4 (.NET CLR 3.5.30729)"
"Mozilla/5.0 (Windows; U; Windows NT 6.0; en-GB; rv:1.9.1.5) Gecko/20091102 Firefox/3.5.5 (.NET CLR 3.5.30729)"
"Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.9.2.12) Gecko/20101027 Ubuntu/10.04 (lucid) Firefox/3.6.12 GTB7.1"
"Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.0)"
)


VERSION="o.5"
GOOGLE=www.google.com
COMMENTS=1
HOSTNAMESONLY=0
LOGFILE=
DEPTH=5
AGENT=${AGENTS[ $(($RANDOM % ${#AGENTS[@]})) ]} # random user agent
NUMRESULTS=10
DICTIONARY=
WAIT=0
BOT_SLEEP=60m
PASSCURL=
INPUTFILE=

while getopts 'c:d:n:g:l:i:u:e:s:x:otq' OPTION
do
 case $OPTION in
 c) CC=`echo $OPTARG | tr '[:lower:]' '[:upper:]' `;;
 d) DEPTH=$OPTARG ;;
# n) NUMRESULTS=$OPTARG ;;
 g) GOOGLE=$OPTARG ;;
 l) LOGFILE=$OPTARG ;;
 o) HOSTNAMESONLY=1 ;;
 i) INPUTFILE=$OPTARG ;;
 u) set_agent $OPTARG ;;
 e) DICTIONARY=$OPTARG ;;
 s) WAIT=$OPTARG ;;
 q) COMMENTS=0 ;;
 x) PASSCURL=$OPTARG ;;
 t) list_useragents;exit ;;
 esac
done
shift $(($OPTIND -1 ))

if [ -z "$1" ] && [ -z "$INPUTFILE" ] ; then
GRAY="\033[1;30m"
RED="\033[0;31m"
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


 echo -e "$LIGHT_GRAY _______ _____ _____                       __                                   
$LIGHT_GRAY|     __|   __|   __|.-----..-----..-----.|  |.-----.$LIGHT_GRAY.-----..----..---.-..-----.
$LIGHT_BLUE|    |  |  |  |  |  ||  o  ||  o  ||  o  ||  ||  o__|$LIGHT_BLUE|__ --||  __||  o  ||     |
$BLUE|_______|_____|_____||_____||_____||___  ||__||_____|$BLUE|_____||____||___._||__|__|
$SUBTITLE   G-G-Googlescan v$VERSION (o7/2o1o)  $BLUE |_____|  	  $SUBTITLE  by urbanadventurer$NO_COLOUR
------------.-------------------------------------------------------------------
Description | Enumerate hostnames and URLs using the Google Search Engine
Homepage    | www.morningstarsecurity.com/research/gggooglescan
Author      | Andrew Horton (urbanadventurer) from Security-Assessment.com
Features    | Antibot avoidance, Search within a country, Horizontal searching,
            | URL encoding and more
------------'-------------------------------------------------------------------

Usage: $0 [OPTION]... [QUERY|-i]

 -i=INPUTFILE\tFile containing search queries
 -e=WORDLIST\tCombine each word from a wordlist with the query (avoid deep
\t\tqueries), can combine with -i
 -c=CC\t\tSearch within a country, eg. au, uk or nz
 -d=NUM\t\tDepth of results. Num of pages to return. Default: $DEPTH
 -g=IP\t\tIP or hostname of a Google search website.
\t\tDefault: $GOOGLE
 -l=FILE\tLog file, output is appended if the file already exists
 -o\t\tOutput hostnames, instead of URLs
 -u=AGENT|NUM\tUser Agent. Default is to randomly select one
 -t\t\tList user agents
 -s=SECONDS\tSleep for SECONDS between each query. Default: $WAIT
 -q\t\tQuiet. Turn off comment lines.
 -x\t\tPass cmdline args to curl, eg. -x \"--socks5 127.0.0.1:8118\"
"
# -n=NUM\t\tNumber of results per page. Default: $NUMRESULTS
 exit
fi

#echo "# User-Agent: $AGENT"


function run_query {
query="$1"

 if (( $COMMENTS )); then 
  echo "# Query: $query"
 fi
  
TMPFILE=`mktemp temp-gggXXXXXXXXXX` || exit 1

# escape query string
# Thanks blueyed for the perl snippet at http://stackoverflow.com/questions/296536/urlencode-from-a-bash-script
query=`echo -n "$query" | perl -p -e 's/([^A-Za-z0-9])/sprintf("%%%02X", ord($1))/seg'`

if [ -n "$CC" ]; then
 country="&meta=cr%3Dcountry$CC"
else
 country=""
fi

for (( i=0; $i<$DEPTH; i++ ))
do
	if [ i = 0 ]; then
	 start=""
	else
	 start="&start=$(( i * 10 ))"
	fi

	URL="http://$GOOGLE/search?q=$query$country$start&num=$NUMRESULTS"

	if (( $COMMENTS )); then
		echo "# $URL" >&2
	fi
	curl "$PASSCURL" -A "$AGENT" "$URL" 2>/dev/null > $TMPFILE

	LINKS=`cat $TMPFILE | egrep -o "href=\"http[^\"]+" | cut -d '"' -f 2`
 
	# remove links in the blacklist
	LINKS=`echo "$LINKS" | egrep -v "(www.youtube.com)|(google.com)|(/search\?q=cache)"`
 
	if (( $HOSTNAMESONLY )); then
		echo "$LINKS" | cut -d / -f 3 | cut -d : -f 1 | grep -v "^$" | tee -a $LOGFILE
	else
		echo "$LINKS" | grep -v "^$" | tee -a $LOGFILE
	fi

	# test for end of results
	if `grep -q "In order to show you the most relevant results, we have omitted some entries very similar" $TMPFILE`; then
		if (( $COMMENTS )); then
			echo "# results omitted page" >&2
		fi
		rm -f $TMPFILE
		break
	fi

	if `grep -q "<H1>Bad Request</H1>" $TMPFILE`; then
		if (( $COMMENTS )); then
			echo "# Bad Request. You've done something wrong :|" >&2
		fi
		rm -f $TMPFILE
		break
	fi
 
	if `grep -q "http://sorry.google.com/sorry/?continue=" $TMPFILE`; then
		if (( $COMMENTS )); then
			echo "# You're acting like a bot. Waiting for $BOT_SLEEP" >&2
		fi
		sleep $BOT_SLEEP
		rm -f $TMPFILE
		break
	fi

	if ! `grep -q "&amp;start=$(( (i+1) * 10 ))" $TMPFILE`; then
		if (( $COMMENTS )); then
			echo "# next page of results link missing" >&2
		fi
		rm -f $TMPFILE
		break
	fi


	rm -f $TMPFILE
	sleep $WAIT
done
}

if [ -n "$INPUTFILE" ]; then
	cat "$INPUTFILE" | while read QUERY;
	do
		if [ -n "$DICTIONARY" ]; then
			while read line;
			do
			 echo "# $QUERY $line"
			 run_query "$QUERY $line"
			done < "$DICTIONARY"
		else
			run_query "$QUERY"
		fi
	done
else
	QUERY="$1"
	if [ -n "$DICTIONARY" ]; then
		while read line;
		do
		 echo "# $QUERY $line"
		 run_query "$QUERY $line"
		done < "$DICTIONARY"
	else
		run_query "$QUERY"
	fi
fi


