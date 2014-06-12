##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "MacHTTP" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-06-04
version "0.1"
description "MacHTTP is a webserver designed to run on Mac OS versions 7.x through 9.x. It was written by software developer Chuck Shotton and was originally shareware; it is now available in source code form from SourceForge.net under the Perl Artistic License. It is still used on some older Macintosh hardware. It was later commercialized as WebSTAR, sold originally by StarNine and later bought by Quarterdeck Software. - More Info: http://en.wikipedia.org/wiki/MacHTTP"
# Homepage: http://www.machttp.org/downloads/machttp/

# ShodanHQ results as at 2011-06-04 #
# 40 for machttp



# Passive #
def passive
	m=[]

	# Version Detection # HTTP Server Header
	m << { :version=>@headers["server"].scan(/^MacHTTP\/([^\s]+)$/) } if @headers["server"] =~ /^MacHTTP\/([^\s]+)$/

	# Return passive matches
	m
end

end

