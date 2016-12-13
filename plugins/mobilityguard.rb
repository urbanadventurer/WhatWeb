##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "MobilityGuard" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-08-05
version "0.1"
description "MobilityGuard is a suite of security products from the company by the same name."
website "http://www.mobilityguard.com/"

# ShodanHQ results as at 2011-08-05 #
# 123 for MobilityGuard



# Matches #
matches [

# Cookies Required Page # More info link # /mg-local/cookie.html
{ :url=>"/mg-local/cookie.html", :text=>'<font size=2>Click here for more information about MobilityGuard.</font></a></center><br>' },

]

# Passive #
def passive
	m=[]

	# Version Detection # HTTP Server Header
	if @headers["server"] =~ /^MobilityGuard/

		m << { :name=>"HTTP Server Header" }

		if @headers["server"] =~ /^MobilityGuard v([^\s]+)$/
			m << { :version=>"#{$1}" }
		end
	end

	# Return passive matches
	m
end
end

