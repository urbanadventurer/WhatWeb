##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "GoServe" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-05-31
version "0.1"
description "GoServe - A Web and Gopher Server for OS/2. SRE-http is a highly configurable http server which requires GoServe - Homepage: http://www2.hursley.ibm.com/goserve"

# More Info #
# SRE-http is a highly configurable http/1.1 web server for OS/2. To use the SRE-http web server, you will need GoServe (a free, IBM EWS, OS/2 Internet server).  - Homepage: http://www.srehttp.org/server/

# ShodanHQ results as at 2011-05-31 #
# 32 for GoServe
# 14 for GoServe -OS

# Examples #
examples %w|
2.105.54.146
148.6.176.241
137.111.41.83
64.246.134.196
99.253.30.199
87.54.234.173
87.54.234.171
66.170.137.132
87.54.234.168
87.54.234.165
|

# Passive #
def passive
	m=[]

	# HTTP Server Header
	if @headers["server"] =~ /^GoServe/

		# Version Detection
		m << { :version=>@headers["server"].scan(/^GoServe\/([^\s]+)$/) } if @headers["server"] =~ /^GoServe\/([^\s]+)$/

		if @headers["server"] =~ /^GoServe for OS\/2, version [^\s^;]+; SRE-http [\d\.]+$/

			# Version Detection
			m << { :version=>@headers["server"].scan(/^GoServe for OS\/2, version ([^\s^;]+); SRE-http [\d\.]+$/) }

			# Module Detection
			m << { :module=>@headers["server"].scan(/^GoServe for OS\/2, version [^\s^;]+; (SRE-http [\d\.]+)$/) }

		end

	end

	# Return passive matches
	m
end

end

