##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Worldgroup-Server" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-08-06
version "0.1"
description "The Major BBS (sometimes MajorBBS or MBBS) was a bulletin board system server developed between 1986 and 1999 by Galacticomm. In 1995 it was renamed Worldgroup Server and bundled with a user client interface program named Worldgroup Manager for Microsoft Windows. Originally DOS based, two of the versions were also available as Unix-based edition, and the last versions were also available for Windows NT-based servers. - More Info: http://en.wikipedia.org/wiki/The_Major_BBS"

# ShodanHQ results as at 2011-08-06 #
# 87 for Worldgroup



# Passive #
def passive
	m=[]

	# Version Detection # HTTP Server Header
	if @headers["server"] =~ /^Worldgroup\/([^\s]+)/
		m << { :version=>"#{$1}" }
	end

	# Return passive matches
	m
end
end

