##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Fujitsu-Router" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-11
version "0.1"
description "Fujitsu-Router - Homepage: http://fujitsu.com/"

# ShodanHQ results as at 2011-03-11 #
# All results as are from Japan
# 68 for Si-R220B
# 11 for Si-R570
# 88 for Si-R80brin
# 109 for Si-R180B
# 302 for Si-R170



# Passive #
def passive
	m=[]

	# Model Detection # HTTP Server Header
	m << { :model=>@headers["server"].scan(/^(Si-[A-Za-z\d]{4,10})$/) } if @headers["server"] =~ /^Si-[A-Za-z\d]{4,10}$/

	# Return passive matches
	m
end

end


