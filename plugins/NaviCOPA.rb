##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "NaviCOPA" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-25
version "0.1"
description "The NaviCOPA Web Server Software installs on any version of the Microsoft Windows operating system from 98 and up, including Windows Vista, and automatically configures itself for instant HTTP access. NaviCOPA does not limit the number of connections and comfortably serves 1000's of simultaneous connections - Homepage: http://www.navicopa.com/"

# ShodanHQ results as at 2011-03-25 #
# 4 for InterVations



# Passive #
def passive
	m=[]

	# Version Detection # HTTP Server Header
	m << { :version=>@headers["server"].scan(/^InterVations NaviCOPA Version ([\d\.]+) [\d]{1,2}[a-z]{2} [A-Z][a-z]+ [\d]{4}$/) } if @headers["server"] =~ /InterVations NaviCOPA Version ([\d\.]+) [\d]{1,2}[a-z]{2} [A-Z][a-z]+ [\d]{4}$/

	# Set-Cookie
	m << { :name=>"NaviCopaSession Cookie" } if @headers["set-cookie"] =~ /^NaviCopaSession=[a-z0-9]{8}; path=\//

	# Return passive matches
	m

end

end

