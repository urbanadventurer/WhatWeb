##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# https://www.morningstarsecurity.com/research/whatweb
##
Plugin.define do
name "HP-ProCurve-Switch"
authors [
  "Brendan Coles <bcoles@gmail.com>", # 2011-03-12
  "Andrew Horton", # v0.2 # 2016-04-20 # Moved patterns from passive function to matches[]. 
]
version "0.2"
description "HP ProCurve Switch"
website "http://www.hp.com/rnd/"

# ShodanHQ results as at 2011-03-12 #
# 10,344 for eHTTP
#  6,686 for eHTTP -Authenticate
#  3,370 for eHTTP Authenticate -ProCurve
#    288 for eHTTP Authenticate ProCurve

matches [
	# HTTP Server Header
	{ :regexp=>/^eHTTP/, :search=>"headers[server]" },
	
	# Version Detection
	{ :version=>/^eHTTP v([\d\.]{1,3})$/, :search=>"headers[server]" },
	
]

# Passive #
passive do
	m=[]

	# HTTP Server Header
	if @headers["server"] =~ /^eHTTP/
	
		# Model Detection # WWW-Authenticate
		m << { :model=>@headers["www-authenticate"].scan(/Basic realm="(HP|ProCurve) ([^"]{6})"/)[0][1] } if @headers["www-authenticate"] =~ /Basic realm="(HP|ProCurve) ([^"]{6})"/
	
		# Model Detection # Title
		m << { :model=>@body.scan(/<title>[^\(]+ProCurve[^\(]+Switch[^\(]+\((ProCurve )?([^\(]+)\)[^\(]+<\/title>/m)[0][1] } if @body =~ /<title>[^\(]+ProCurve[^\(]+Switch[^\(]+\((ProCurve )?([^\(]+)\)[^\(]+<\/title>/ 

	end

	# Return passive matches
	m
end

end


