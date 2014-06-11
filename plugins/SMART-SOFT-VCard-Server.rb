##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "SMART-SOFT-VCard-Server" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-05-14
version "0.1"
description "SMART-SOFT VCard HTTP/SSL server - Homepage: http://www.smart-soft.ru/"

# ShodanHQ results as at 2011-05-14 #
# 36 for SMART-SOFT VCard
# 36 for Directory%20browsing%20not%20allowed
# All results are from the Russian Federation



# Matches #
matches [

# Title and h1 title with hr line
{ :text=>"<title>Error</title></head><body><h1>403 - Directory browsing not allowed</h1><hr>SMART-SOFT VCard HTTP/SSL server" },

# Version Detection # Title and h1 title with hr line
{ :version=>/<title>Error<\/title><\/head><body><h1>403 - Directory browsing not allowed<\/h1><hr>SMART-SOFT VCard HTTP\/SSL server \(([^\)]+)\)<br>/ },

# Server Name Detection # Title and h1 title with hr line
 { :string=>/<title>Error<\/title><\/head><body><h1>403 - Directory browsing not allowed<\/h1><hr>SMART-SOFT VCard HTTP\/SSL server \([^\)]+\)<br>Server - ([\w]+)/ },

]

# Passive #
def passive
	m=[]

	# Version Detection # HTTP Server Header
	m << { :version=>@headers["server"].scan(/^SMART-SOFT VCard HTTP\/SSL server \(([^\)]+)\)$/) } if @headers["server"] =~ /^SMART-SOFT VCard HTTP\/SSL server \(([^\)]+)\)$/

	# Exception header
	m << { :name=>"Exception header" } if @headers["exception"] =~ /^Directory%20browsing%20not%20allowed$/

	# Return passive matches
	m
end

end

