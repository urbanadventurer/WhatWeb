##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "AVTech-Video-Web-Server" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-07-20
version "0.1"
description "Video web server front end"
website "http://www.avtech.com.hk/eng/CCTV_System_Networking_VWS.htm"

# ShodanHQ results as at 2010-07-20 #
# About 13,446 Shodan results for Server:"AV787 Video Web Server"

# Google results as at 2010-07-20 #
# 14 for intitle:"VIDEO WEB SERVER" -intext intext:"Video Web Server" "Any time & Any where" username password

# Dorks #
dorks [
'intitle:"VIDEO WEB SERVER" -intext intext:"Video Web Server" "Any time & Any where" username password'
]



# Matches #
matches [

# Default TItle
{ :text=>'<title>--- VIDEO WEB SERVER ---</title>' },

# Submit button HTML
{ :text=>'<input type="button" name="Download" value="Download AP" class="button" onClick="MM_goToURL(\'parent\',\'ftp://211.22.74.18/AV732E/setup.exe\');return document.MM_returnValue" title="Download AP">', :version=>"AVC732E" },

{ :text=>'<input type="submit" name="Download" value="Download AP" class="button" onClick="MM_goToURL(\'parent\',\'ftp://211.22.74.18/AV733/setup.exe\');return document.MM_returnValue" title="Download AP">', :version=>"AVC733" },

]


end

