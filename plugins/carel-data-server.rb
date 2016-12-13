##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2016-04-19 # Andrew Horton
# Move HTTP server match from passive function to matches[]
##
Plugin.define "Carel-Data-Server" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-07
version "0.2"
description "Pl@ntVisor is a communication data server distributed by CAREL Italy. It is now obsolete and replaced by Pl@ntVisorPRO"

# ShodanHQ results as at 2011-03-07 #
# 265 for Document follows CarelDataServer
# 265 for CarelDataServer



# Matches #
matches [

# Default JavaScript HTML
{ :text=>'<script type="text/javascript" language="JavaScript" src="/MPwebCoreFn.js"></script>' },

# Default logo HTML
{ :text=>'<img style="position:absolute;left:0;top:0;" src=plv_primoLW.jpg zwidth="100%" zheight="100%">' },

# Default background image
{ :url=>"/plv_primoLW.jpg", :md5=>"df1e885e87f6ab393a90b908b6ce5dc4" },

# Version Detection # HTTP Server header
{ :version=>/^CarelDataServer\/([\d\.]{1,10})/, :search=>"headers[server]" },

]

# Passive #
def passive
	m=[]

	# Server: CarelDataServer
	if @headers["server"] =~ /^CarelDataServer\/[\d\.]{1,10}/

		# Account Detection # LoginName select tag
		accounts = @body.scan(/<select name='LoginName'>(.*)<\/select>/m).flatten if @body =~ /<select name='LoginName'>(.*)<\/select>/m
		m << { :account=>accounts.to_s.scan(/<option value="([^"]+)"[^>]*>[^<]+<\/option>/).flatten } if accounts.to_s =~ /<option value="([^"]+)"[^>]*>[^<]+<\/option>/

	end

	# Return passive matches
	m
end

end
