##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Carel-Data-Server" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-07
version "0.1"
description "Pl@ntVisor is a communication data server distributed by CAREL Italy. It is now obsolete and replaced by Pl@ntVisorPRO"

# ShodanHQ results as at 2011-03-07 #
# 265 for Document follows CarelDataServer
# 265 for CarelDataServer

# Examples #
examples %w|
213.3.38.5
87.96.230.98
95.242.53.23
95.9.83.132
88.41.183.196
80.51.39.34
193.219.74.179
83.230.241.183
213.168.8.218
95.50.53.69
202.78.40.56
78.189.188.213
87.22.191.86
62.85.23.25
62.92.62.68
89.96.229.126
212.174.88.14
79.4.39.122
78.187.197.242
80.235.17.142
213.213.156.176
88.196.74.2
203.13.76.233
78.189.155.249
85.41.97.9
|

# Matches #
matches [

# Default JavaScript HTML
{ :text=>'<script type="text/javascript" language="JavaScript" src="/MPwebCoreFn.js"></script>' },

# Default logo HTML
{ :text=>'<img style="position:absolute;left:0;top:0;" src=plv_primoLW.jpg zwidth="100%" zheight="100%">' },

# Default background image
{ :url=>"/plv_primoLW.jpg", :md5=>"df1e885e87f6ab393a90b908b6ce5dc4" },

]

# Passive #
def passive
	m=[]

	# Server: CarelDataServer
	if @meta["server"] =~ /^CarelDataServer\/[\d\.]{1,10}/

		# Version Detection # HTTP Server header
		m << { :version=>@meta["server"].scan(/^CarelDataServer\/([\d\.]{1,10})/) }

		# Account Detection # LoginName select tag
		accounts = @body.scan(/<select name='LoginName'>(.*)<\/select>/m) if @body =~ /<select name='LoginName'>(.*)<\/select>/m
		m << { :account=>accounts.to_s.scan(/<option value="([^"]+)"[^>]*>[^<]+<\/option>/) } if accounts.to_s =~ /<option value="([^"]+)"[^>]*>[^<]+<\/option>/

	end

	# Return passive matches
	m
end

end


