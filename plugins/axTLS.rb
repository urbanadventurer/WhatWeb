##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "axTLS" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-05-30
version "0.1"
description "The axTLS embedded SSL project is a highly configurable client/server TLSv1 SSL library designed for platforms with small memory requirements. It comes with a small HTTP/HTTPS server and additional test tools. - Hompage: http://axtls.sourceforge.net/"

# ShodanHQ results as at 2011-05-30 #
# 592 for axhttpd



# Passive #
def passive
	m=[]

	# Version Detection # HTTP Server Header
	m << { :version=>@headers["server"].scan(/^axhttpd\/([^\s]+)$/) } if @headers["server"] =~ /^axhttpd\/([^\s]+)$/

	# Return passive matches
	m
end

end

