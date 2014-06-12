##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Citrix-ConfProxy" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-04-11
version "0.1"
description "Citrix ConfProxy ISAPI - Homepage: http://www.citrix.com/"

# ShodanHQ results as at 2011-04-11 #
# 73 for confproxy



# Passive #
def passive
	m=[]

	# Version Detection # HTTP Server Header
	m << { :version=>@headers["server"].scan(/^confproxy\/([\d\.]+)/) } if @headers["server"] =~ /^confproxy\/([\d\.]+)/

	# Return passive matches
	m
end

end

