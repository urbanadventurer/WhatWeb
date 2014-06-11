##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2011-01-08 #
# Updated HTTP Server Header match
##
Plugin.define "Boa-WebServer" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-10-26
version "0.2"
description "Boa Webserver - Do You Feel the Need for Speed? Boa currently seems to be the favorite web server in the embedded crowd, and embedded Linux, despite all the marketing hype, really is a big deal. Supposedly, an older version of Boa, v0.92q, runs in 32K address space on m68k, like used in uCLinux. - homepage: http://www.boa.org/"

# About 176872 ShodanHQ results for "server: boa" @ 2010-10-26



# Passive #
def passive
	m=[]

	# HTTP Server Header
	m << { :version=>@headers["server"].to_s.scan(/^[\s]*Boa\/([^\s^\r^\n]+)/i).flatten } if @headers["server"].to_s =~ /^[\s]*Boa\/([^\s^\r^\n]+)/i

	m

end

end

