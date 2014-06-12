##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Abyss-Web-Server" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-04-08
version "0.1"
description "Abyss Web Server is a compact web server available for Windows, Mac OS X, Linux, and FreeBSD operating systems. - Homepage: http://www.aprelium.com/abyssws/"

# ShodanHQ results as at 2011-04-08 #
# 4,097 for Abyss



# Passive #
def passive
	m=[]

	# Version Detection # HTTP Server Header
	m << { :version=>@headers["server"].scan(/^Abyss\/([^\s]+)/) } if @headers["server"] =~ /^Abyss\/([^\s]+)/

	# Return passive matches
	m
end

end

