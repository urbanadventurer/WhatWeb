##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Harris-NetVX" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-30
version "0.1"
description "NetVX combines standards-compliant audio, video and data networking interfaces to integrate with any video plant"
website "http://www.broadcast.harris.com/productsandsolutions/NetworkingEncoding/NetVX/default.asp"

# ShodanHQ results as at 2011-03-30 #
# 41 for harris.asp



# Matches #
matches [

# Powered by text
{ :text=>'<a href="" onclick=\'window.open("http://www.goahead.com")\' title="Powered by the GoAhead Web Server.">' },

]

# Passive #
def passive
	m=[]

	# Model Detection # Title
	if @headers["server"] =~ /^GoAhead-Webs$/ and @body =~ /<title>([^\s]+) Control<\/title>/
		m << { :model=>@body.scan(/<title>([^\s]+) Control<\/title>/) }
	end

	# Return passive matches
	m
end

end

