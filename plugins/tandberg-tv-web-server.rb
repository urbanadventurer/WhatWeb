##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Tandberg-TV-Web-Server" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-05-30
version "0.1"
description "Tandberg - Video Conferencing Solutions and Telepresence Products"
website "http://www.tandberg.com/"

# ShodanHQ results as at 2011-05-30 #
# 154 for Tandberg Television Web server



# Passive #
def passive
	m=[]

	# HTTP Server Header or HTTP "Server " Header
	if @headers["server"] =~ /^Tandberg Television Web server$/ or @headers["server "] =~ /^Tandberg Television Web server$/
		m << { :name=>"HTTP Server Header" }
	end

	# Return passive matches
	m
end

end

