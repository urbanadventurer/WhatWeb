##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "ruTorrent" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-05-13
version "0.1"
description "ruTorrent is a front-end for the popular Bittorrent client rTorrent."
website "http://code.google.com/p/rutorrent/"

# ShodanHQ results as at 2011-05-13 #
# 62 for ruTorrent



# Passive #
def passive
	m=[]

	# WWW-Authenticate realm
	m << { :name=>"WWW-Authenticate realm" } if @headers["www-authenticate"] =~ /^Basic realm="My ruTorrent web site"$/

	# Return passive matches
	m
end

end

