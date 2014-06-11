##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Netscape-Enterprise" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-14
version "0.1"
description "Netscape Enterprise Server was a web server developed originally by Netscape Communications Corporation. The product has since been renamed Sun Java System Web Server, reflecting the product's acquisition by Sun Microsystems. - Homepage: http://wikis.sun.com/display/WebServer/Sun+Java+System+Web+Server"

# ShodanHQ results as at 2011-03-14 #
# 11,641 for Netscape-Enterprise



# Passive #
def passive
	m=[]

	# Version Detection # HTTP Server Header
	m << { :version=>@headers["server"].scan(/^Netscape-Enterprise\/(.+)$/) } if @headers["server"] =~ /^Netscape-Enterprise\/(.+)$/

	# Return passive matches
	m

end

end

