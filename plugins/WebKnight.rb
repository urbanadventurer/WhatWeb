##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "WebKnight" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-14
version "0.1"
description "AQTRONIX WebKnight is an application firewall for IIS and other web servers and is released under the GNU General Public License. More particularly it is an ISAPI filter that secures your web server by blocking certain requests. If an alert is triggered WebKnight will take over and protect the web server. It does this by scanning all requests and processing them based on filter rules, set by the administrator. - Homepage: http://www.aqtronix.com/?PageID=99"

# ShodanHQ results as at 2011-03-14 #
# 276 for WebKnight



# Passive #
def passive
	m=[]

	# Version Detection # HTTP Server Header
	m << { :version=>@headers["server"].scan(/^WebKnight\/(.+)$/) } if @headers["server"] =~ /^WebKnight\/(.+)$/

	# Return passive matches
	m

end

end

