##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Acme_Serve" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-06-01
version "0.1"
description "Minimal Java HTTP server class. This class implements a very small embeddable HTTP server. It runs Servlets compatible with the API used by JavaSoft's JavaServer server. Used as an embedded server for many devices. - Homepage: http://www.acme.com/java/software/Acme.Serve.Serve.html"

# ShodanHQ results as at 2011-06-01 #
# 600 for Acme.Serve
# 592 for Acme.Serve -TJWS
#  95 for Acme.Serve -JWS
#  87 for Acme.Serve -JWS -TJWS
#  87 for Acme.Serve -Rogatkin

# Examples #
examples %w|
192.68.223.228
208.76.173.18
161.253.152.178
216.48.129.151
130.184.96.9
128.200.129.50
160.129.6.231
168.215.123.30
99.102.26.89
|

trigger "Acme.Serve"

# Passive #
def passive
	m=[]

	# HTTP Server Header
	if @headers["server"] =~ /^Acme\.Serve\/v([\d\.]+) of [\d]{2}[a-z]{3}[\d]{2}$/

		# Version Detection
		m << { :version=>@headers["server"].scan(/^Acme\.Serve\/v([\d\.]+) of [\d]{2}[a-z]{3}[\d]{2}$/) }

		# Date Detection
		m << { :string=>@headers["server"].scan(/^Acme\.Serve\/v[\d\.]+ of ([\d]{2}[a-z]{3}[\d]{2})$/) }

	end

	# Return passive matches
	m
end

end

