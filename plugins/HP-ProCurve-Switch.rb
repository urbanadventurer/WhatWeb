##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "HP-ProCurve-Switch" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-12
version "0.1"
description "HP ProCurve Switch - Homepage: http://www.hp.com/rnd/"

# ShodanHQ results as at 2011-03-12 #
# 10,344 for eHTTP
#  6,686 for eHTTP -Authenticate
#  3,370 for eHTTP Authenticate -ProCurve
#    288 for eHTTP Authenticate ProCurve



# Passive #
def passive
	m=[]

	# HTTP Server Header
	if @headers["server"] =~ /^eHTTP v([\d\.]{1,3})$/
	
		# Version Detection
		m << { :version=>@headers["server"].scan(/^eHTTP v([\d\.]{1,3})$/) }
	
		# Model Detection # Title
		m << { :model=>@body.scan(/<title>[^\(]+ProCurve[^\(]+Switch[^\(]+\((ProCurve )?([^\(]+)\)[^\(]+<\/title>/m)[0][1] } if @body =~ /<title>[^\(]+ProCurve[^\(]+Switch[^\(]+\((ProCurve )?([^\(]+)\)[^\(]+<\/title>/m
	
		# Model Detection # WWW-Authenticate
		m << { :model=>@headers["www-authenticate"].scan(/Basic realm="(HP|ProCurve) ([^"]{6})"/)[0][1] } if @headers["www-authenticate"] =~ /Basic realm="(HP|ProCurve) ([^"]{6})"/
	
	end

	# Return passive matches
	m
end

end


