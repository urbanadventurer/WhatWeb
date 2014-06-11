##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Kerio-WebSTAR" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-05-31
version "0.1"
description "Kerio WebSTAR (formerly 4D WebSTAR and StarNine WebSTAR) is an HTTP web server for Mac OS X with older versions running on classic Mac OS. On June 30, 2008, WebSTAR was officially discontinued. Technical support for the product ended on June 30, 2009. - More info: en.wikipedia.org/wiki/Kerio_WebSTAR"

# ShodanHQ results as at 2011-05-31 #
# 5,486 for WebSTAR
# 3,267 for WebSTAR -4d



# Passive #
def passive
	m=[]

	# HTTP Server Header
	if @headers["server"] =~ /^(Kerio_)?WebSTAR/

		# Version Detection
		m << { :version=>@headers["server"].scan(/^WebSTAR\/([^\s^\(]+)/) } if @headers["server"] =~ /^WebSTAR\/([^\s^\(]+)/
		m << { :version=>@headers["server"].scan(/^Kerio_WebSTAR\/([^\s^\(]+)/) } if @headers["server"] =~ /^Kerio_WebSTAR\/([^\s^\(]+)/
		m << { :version=>@headers["server"].scan(/^WebSTAR ([\d\.]+ .+)$/) } if @headers["server"] =~ /^WebSTAR ([\d\.]+ .+)$/

	end

	# HTTP Server Header
	if @headers["server"] =~ /^4D_WebStar_[A-Z]\//

		m << { :name=>"HTTP Server Header" }

		# Version Detection
		m << { :version=>@headers["server"].scan(/^4D_WebStar_[A-Z]\/([\d\.]+)/) } if @headers["server"] =~ /^4D_WebStar_[A-Z]\/([\d\.]+)/

	end

	# Return passive matches
	m
end

end

