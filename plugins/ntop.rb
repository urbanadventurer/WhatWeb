##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "ntop" do
author "Brendan Coles <bcoles@gmail.com>" # 2012-09-12
version "0.1"
description "ntop is a network traffic probe that shows the network usage, similar to what the popular top Unix command does."
website "http://www.ntop.org/products/ntop/"

# Interesting Info # /textinfo.html

# ShodanHQ results as at 2012-09-12 #
# 72 for ntop

# Google results as at 2012-09-12 #
# 35 for intitle:"Global Traffic Statistics" "Name" "Device" "Type"

# Dorks #
dorks [
'intitle:"Global Traffic Statistics" "Name" "Device" "Type"'
]



# Matches #
matches [

# HTTP Server Header # Version Detection
{ :search=>"headers[server]", :version=>/^ntop\/([^\s]+)/ },

# RSS Feed Links
{ :text=>'<link rel="alternate" type="application/rss+xml" title="ntop RSS Feed" href="http://www.ntop.org/blog/?feed=rss2" />' },

# Title
{ :certainty=>75, :text=>'<TITLE>Global Traffic Statistics</TITLE>' },

# WWW-Authenticate: Basic realm="NTOP" 
{ :search=>"headers[www-authenticate]", :text=>'Basic realm="NTOP"' },

]

end

