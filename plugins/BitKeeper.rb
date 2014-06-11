##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "BitKeeper" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-06-04
version "0.1"
description "BitKeeper Bug Manager - BitKeeper is paving the way for the next generation of SCM tools. As the leader in distributed configuration management and the culmination of a decade of innovation, BitKeeper has been shown to double the pace of software development. - Homepage: http://bitkeeper.com/"

# Google results as at 2011-06-04 #
# 1 for intitle:"BugManager Home"
# 1 for inurl:"/cgi-bin/query.cgi?.page=advquery"

# ShodanHQ results as at 2011-06-04 #
# 1 for bkhttp



# Matches #
matches [

# Advanced Query link
{ :text=>'<A class="tab" HREF="/cgi-bin/query.cgi?.page=advquery">Advanced Query</A>' },

]

# Passive #
def passive
	m=[]

	# Version Detection # HTTP Server Header
	m << { :version=>@headers["server"].scan(/^bkhttp\/([^\s]+)$/) } if @headers["server"] =~ /^bkhttp\/([^\s]+)$/

	# Return passive matches
	m
end

end

