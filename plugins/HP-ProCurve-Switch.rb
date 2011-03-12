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

# Examples #
examples %w|
133.54.208.7
150.217.240.21
12.139.172.151
134.39.200.161
194.1.160.142
66.150.9.246
139.142.60.242
66.193.200.46
24.105.173.241
193.219.34.191
158.165.78.11
204.10.188.62
198.209.212.245
194.117.186.201
74.200.9.122
67.90.64.118
74.50.27.7
134.121.162.246
194.255.101.1
110.165.64.209
14.206.0.65
4.49.108.182
212.214.100.101
95.97.24.94
64.60.98.141
95.211.112.246
12.106.76.16
206.225.108.2
85.158.179.115
203.233.120.142
|

# Passive #
def passive
	m=[]

	# HTTP Server Header
	if @meta["server"] =~ /^eHTTP v([\d\.]{1,3})$/
	
		# Version Detection
		m << { :version=>@meta["server"].scan(/^eHTTP v([\d\.]{1,3})$/) }
	
		# Model Detection # Title
		m << { :model=>@body.scan(/<title>[^\(]+ProCurve[^\(]+Switch[^\(]+\((ProCurve )?([^\(]+)\)[^\(]+<\/title>/m)[0][1] } if @body =~ /<title>[^\(]+ProCurve[^\(]+Switch[^\(]+\((ProCurve )?([^\(]+)\)[^\(]+<\/title>/m
	
		# Model Detection # WWW-Authenticate
		m << { :model=>@meta["www-authenticate"].scan(/Basic realm="(HP|ProCurve) ([^"]{6})"/)[0][1] } if @meta["www-authenticate"] =~ /Basic realm="(HP|ProCurve) ([^"]{6})"/
	
	end

	# Return passive matches
	m
end

end


