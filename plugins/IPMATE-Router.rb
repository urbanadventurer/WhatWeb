##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "IPMATE-Router" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-07
version "0.1"
description "IPMATE router [Japanese] - http://www.ntt-east.co.jp/"

# ShodanHQ results as at 2011-03-07 #
# 1 for IPMATE



# Matches #
matches [

# Default title
{ :text=>'<TITLE>Welcome to IPMATE</TITLE>' },

# Logo
{ :url=>"/images/ipmate_logo.gif", :md5=>"8d16375ac9c6c0fc1c27c0183dfda573" },

]

# Passive #
def passive
	m=[]

	# HTTP Server Header
	m << { :model=>"1300RD" } if @headers["server"] =~ /^IPMATE 1300RD$/

	# Return passive matches
	m
end

end


