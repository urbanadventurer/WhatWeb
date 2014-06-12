##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Monkey" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-06-02
version "0.1"
description "Monkey is a very small, fast and scalable web server for Linux. - Homepage: http://www.monkey-project.com/"

# ShodanHQ results as at 2011-06-02 #
# 41 for Server Monkey Linux



# Passive #
def passive
	m=[]

	# Version Detection # HTTP Server Header
	m << { :version=>@headers["server"].scan(/^Monkey\/([\d\.]+)/) } if @headers["server"] =~ /^Monkey\/([\d\.]+)/

	# Return passive matches
	m
end

end

