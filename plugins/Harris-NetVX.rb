##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Harris-NetVX" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-30
version "0.1"
description "NetVX combines standards-compliant audio, video and data networking interfaces to integrate with any video plant - Homepage: http://www.broadcast.harris.com/productsandsolutions/NetworkingEncoding/NetVX/default.asp"

# ShodanHQ results as at 2011-03-30 #
# 41 for harris.asp

# Examples #
examples %w|
200.67.85.254
71.252.114.107
207.237.37.89
200.23.36.246
201.130.105.166
208.108.2.236
211.58.113.95
208.108.2.237
71.252.114.106
211.58.113.70
142.55.230.118
|

# Matches #
matches [

# Powered by text
{ :text=>'<a href="" onclick=\'window.open("http://www.goahead.com")\' title="Powered by the GoAhead Web Server.">' },

]

# Passive #
def passive
	m=[]

	# Model Detection # Title
	if @meta["server"] =~ /^GoAhead-Webs$/ and @body =~ /<title>([^\s]+) Control<\/title>/
		m << { :model=>@body.scan(/<title>([^\s]+) Control<\/title>/) }
	end

	# Return passive matches
	m
end

end

