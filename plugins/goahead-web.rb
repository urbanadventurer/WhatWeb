##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.3 # 2011-01-29 # Brendan Coles <bcoles@gmail.com>
# Updated regex
##
# Version 0.2
# removed :name & :probability
##
Plugin.define "GoAhead-Webs" do
author "Andrew Horton"
version "0.3"
description "Opensource, embedded webserver. Homepage: http://www.goahead.com/products/webserver/default.aspx"

# ShodanHQ results as at 2011-01-29 #
# 453222 for GoAhead Webs

# Examples #
examples %w|
120.138.16.61
202.89.36.233
175.115.218.6
66.31.253.181
77.236.193.140
200.202.225.35
122.254.45.241
189.14.249.222
|

# Matches #
matches [

	{ :text=>"response_code_begin ERIC_RESPONSE_OK response_code_end response_msg_begin  response_msg_end" }

]

# Passive #
def passive
	m=[]

	# HTTP Server header
	m << {:name=>"HTTP Server header"} if @meta['server'] =~ /GoAhead-Webs/i

	# Return passive matches
	m
end

end

