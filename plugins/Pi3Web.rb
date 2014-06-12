##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Pi3Web" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-06-02
version "0.1"
description "Pi3Web is a free, multithreaded, highly configurable and extensible HTTP server and development environment for cross platform internet server development and deployment. - Homepage: http://pi3web.sourceforge.net/pi3web/"

# ShodanHQ results as at 2011-06-02 #
# 74 for Pi3Web



# Passive #
def passive
	m=[]

	# Version Detection # HTTP Server Header
	m << { :version=>@headers["server"].scan(/^Pi3Web\/([^\s]+)$/) } if @headers["server"] =~ /^Pi3Web\/([^\s]+)$/

	# Return passive matches
	m
end

end

