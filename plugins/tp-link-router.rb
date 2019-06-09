##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "TP-Link-Router"
authors [
  "Aung Khant, http://yehg.net",
  "Brendan Coles <bcoles@gmail.com>", # v0.2 # 2011-01-29 # Added model detection. Added HTTP server header match. Added 401 error match. 
]
version "0.2"
description "Detect TP-Link Router"
website "http://www.tp-link.com/"

# ShodanHQ results as at 2011-01-29 #
# 13,292 for TP-LINK

	

# Matches #
matches [

	# 404 Error
	{ :text=>'Operating System Error Nr:3997698:  <P><HR><H2>File not found</H2>' },

	# 401 Error
	{ :text=>'Operating System Error Nr:3997698: HTM <P><HR><H2>Access denied</H2>' },

]

# Passive #
passive do
	m=[]

	# HTTP Server Header
	m << { :name=>"HTTP Server" } if @headers['server'] =~ /TP\-LINK Router/

	# WWW-Authenticate # Model Detection
	m << { :model=>@headers['www-authenticate'].scan(/Basic realm="TP\-LINK ([^\"]*)"/) } if @headers['www-authenticate'] =~ /Basic realm="TP\-LINK ([^\"]*)"/

	# Return passive matches
	m

end

end


