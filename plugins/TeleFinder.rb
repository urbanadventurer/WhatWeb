##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "TeleFinder" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-06-02
version "0.1"
description "TeleFinder is a Macintosh-based bulletin-board system written by Spider Island Software, based on a client.server model whose client end provides a Mac-like GUI. - More Info: http://en.wikipedia.org/wiki/TeleFinder"

# ShodanHQ results as at 2011-06-02 #
# 8 for telefinder



# Passive #
def passive
	m=[]

	# Version Detection # HTTP Server Header
	m << { :version=>@headers["server"].scan(/^TeleFinder\/([\d\.]+)$/) } if @headers["server"] =~ /^TeleFinder\/([\d\.]+)$/

	# Return passive matches
	m
end

end

