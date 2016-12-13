##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.4 # 2013-04-16
# Changed homepage
#
# Version 0.3 # 2011-01-29 # Brendan Coles <bcoles@gmail.com>
# Updated regex
##
# Version 0.2
# removed :name & :probability
##
Plugin.define "GoAhead-Webs" do
author "Andrew Horton"
version "0.4"
description "Opensource, embedded webserver"
website "http://embedthis.com/products/goahead/"

# ShodanHQ results as at 2011-01-29 #
# 453222 for GoAhead Webs



# Matches #
matches [

	{ :text=>"response_code_begin ERIC_RESPONSE_OK response_code_end response_msg_begin  response_msg_end" }

]

# Passive #
def passive
	m=[]

	# HTTP Server header
	m << {:name=>"HTTP Server header"} if @headers['server'] =~ /GoAhead-Webs/i

	# Return passive matches
	m
end

end

