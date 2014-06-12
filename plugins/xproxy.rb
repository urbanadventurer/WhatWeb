##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "xproxy" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-13
version "0.1"
description "xproxy"

# ShodanHQ results as at 2011-03-13 #
# 94 for xproxy -apache -IIS -nginx port:80
# Most results are from Japan



# Passive #
def passive
	m=[]

	# Version Detection # HTTP Server Header
	m << { :version=>@headers["server"].scan(/^xproxy\/([^\(]+)\([\d]+\)$/) } if @headers["server"] =~ /^xproxy\/([^\(]+)\([\d]+\)$/

	# Date Detection # HTTP Server Header
	m << { :string=>@headers["server"].scan(/^xproxy\/[^\(]+\(([\d]+)\)$/) } if @headers["server"] =~ /^xproxy\/[^\(]+\(([\d]+)\)$/

	# Return passive matches
	m

end

end

