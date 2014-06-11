##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2011-02-12 #
# Updated regex match
##
Plugin.define "CSCSSM" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-10-23
version "0.2"
description "CSCSSM Proxy server"

# ShodanHQ results as at 2010-10-23
# 117 for Proxy-agent:CSCSSM



# Passive #
def passive
	m=[]

	# Proxy-Agent HTTP Header
	m << { :name=>"Proxy-Agent HTTP Header" } if @headers["proxy-agent"].to_s =~ /^[\s]*CSCSSM/
	# Return passive matches
	m
end

end

