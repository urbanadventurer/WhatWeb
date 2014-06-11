##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "OwnServer" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-05-16
version "0.1"
description "OwnServer is a web server used as a webserver for watching security cameras remotly. It allows broadcasting live streaming video on the web through the built-in webserver. - Homepage: http://www.anteco.co.il/"

# ShodanHQ results as at 2011-05-16 #
# 26,527 for OwnServer



# Passive #
def passive
	m=[]

	# Version Detection # HTTP Server Header
	m << { :version=>@headers["server"].scan(/^OwnServer([\d\.]+)$/) } if @headers["server"] =~ /^OwnServer([\d\.]+)$/

	# Return passive matches
	m
end

end

