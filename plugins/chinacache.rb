##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
# Version 0.2 # 2011-01-23 #
# Updated regex
##
Plugin.define "ChinaCache" do
author "Brendan Coles <bcoles@gmail.com>" # 2010-10-30
version "0.2"
description "ChinaCache is a leading content distribution network (CDN) service provider in China. This header, vehicolated through squid, not only tells the world where the content is coming from, it also brings some (obscure) info with it. What is sure is that there is no open standard on how to use this server header field. Probably it is there only for debugging purposes by the employees of ChinaCache."
website "http://www.chinacache.com/"

# ShodanHQ results as at 2010-10-30 #
# About 958 results for "Powered-By-ChinaCache"



# Passive #
def passive
	m=[]

	# powered-by-chinacache HTTP Header
	unless @headers["powered-by-chinacache"].nil?
		m << { :string=>@headers["powered-by-chinacache"].to_s }
	end

	# Return passive matches
	m

end

end

