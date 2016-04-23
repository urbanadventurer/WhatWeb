##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Epic-Web-Honeypot" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-09-23
version "0.1"
description "Epic Web Honeypot"

# Google results as at 2011-09-23 #
# 1 for intitle:"Epic Web Honeypot - Extended edition"



# Matches #
matches [

{ :text=>'<center><font size="3" face="monospace">******************************** Epic Web Honeypot ********************************</font></center>' },

{ :version=>/<center><font size="3" face="monospace">\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\* Version ([^\s]+) \*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*<\/font><\/center>/ },

{ :text=>'<!-- Added OS fingerprints - creds - nmap and honeyd nmap.prints file!-->' },

]

end

