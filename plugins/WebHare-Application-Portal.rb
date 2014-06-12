##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "WebHare-Application-Portal" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-14
version "0.1"
description "WebHare Application Portal - Enterprise Content Management - The flexible design of WebHare AP allows for complex web applications completely tailored to build support for an intranet or website as well as a separate product line. - Homepage: http://www.b-lex.nl/"

# ShodanHQ results as at 2011-03-14 #
# 47 for WebHare Application Portal
# All results are from the Netherlands



# Passive #
def passive
	m=[]

	# Version Detection # HTTP Server Header
	m << { :version=>@headers["server"].scan(/^WebHare Application Portal v([\d\.]+) Webserver$/) } if @headers["server"] =~ /^WebHare Application Portal v([\d\.]+) Webserver$/

	# Return passive matches
	m

end

end

