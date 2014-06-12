##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Jigsaw" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-06-07
version "0.1"
description "Jigsaw is W3C's leading-edge Web server platform, providing a sample HTTP 1.1 implementation and a variety of other features on top of an advanced architecture implemented in Java. - Homepage: http://www.w3.org/Jigsaw/"

# ShodanHQ results as at 2011-06-07 #
# 79 for Jigsaw



# Passive #
def passive
	m=[]

	# Version Detection # HTTP Server Header
	m << { :version=>@headers["server"].scan(/^Jigsaw\/([^\s]+)$/) } if @headers["server"] =~ /^Jigsaw\/([^\s]+)$/

	# Return passive matches
	m
end

end

