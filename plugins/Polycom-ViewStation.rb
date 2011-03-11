##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Polycom-ViewStation" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-11
version "0.1"
description "Polycom ViewStation - video server - Homepage: http://www.polycom.com/"

# ShodanHQ results as at 2011-03-11 #
# 4,489 for Viavideo-Web

# Examples #
examples %w|
164.58.134.31
198.7.132.218
125.17.229.98
63.148.17.98
209.196.232.100
208.123.128.101
208.22.84.13
12.200.138.218
216.255.121.242
160.79.56.200
193.167.100.225
128.123.183.179
209.76.215.22
128.210.157.24
207.197.36.15
66.99.158.194
165.138.27.249
202.83.243.253
67.40.89.154
67.221.128.5
213.81.179.242
192.152.127.24
65.127.183.227
65.167.76.5
208.80.72.248
210.83.233.114
204.134.226.14
|

# Passive #
def passive
	m=[]

	# HTTP Server Header
	if @meta["server"] =~ /^Viavideo-Web$/

		# Server: Viavideo-Web
		m << { :name=>"HTTP Server Header" }

		# Model Detection # /model.js
		m << { :url=>"/model.js", :model=>@body.scan(/^var model="([^"]{2,10})";$/) } if @body =~ /^var model="[^"]{2,10}";$/

		# Version Detection # /u_indexmain.htm
		m << { :url=>"/u_indexmain.htm", :version=>@body.scan(/<td> <span class="bigtextwhite">Release ([^\-]{3,10}) - [\d]{2} [A-Z]{1}[a-z]{2,3} [\d]{4}<\/span>/) } if @body =~ /<td> <span class="bigtextwhite">Release ([^\-]{3,10}) - [\d]{2} [A-Z]{1}[a-z]{2,3} [\d]{4}<\/span>/

	end

	# Return passive matches
	m
end

end


