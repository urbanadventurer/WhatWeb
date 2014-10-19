##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "TBDev-YSE" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-05-14
version "0.1"
description "TBDev Yuna Scatari Edition - Torrent tracker"
website "http://bit-torrent.kiev.ua/"

# ShodanHQ results as at 2011-05-14 #
# 70 for X-Chocolate-to
# 63 for TBDev Yuna Scatari Edition
#  1 for TBDev YSE

# Google results as at 2011-05-14 #
# 146 for "Powered by TBDev v2.0 Yuna Scatari Edition"

# Dorks #
dorks [
'"Powered by TBDev v2.0 Yuna Scatari Edition"'
]



# Matches #
matches [

# HTML Comments
{ :text=>'<!-- /////// Top Navigation Menu for unregistered-->' },
{ :text=>'<!-- /////////// here we go, with the menu //////////// -->' },

# Version Detection # Powered by text
{ :version=>/Powered by <a href="(http:\/\/)?(www\.tbdev\.net|bit-torrent\.kiev\.ua\/)" target="_blank" style="cursor: help;" title="[^"]*" class="copyright">TBDev<\/a> v([\d\.]+) /, :offset=>2 },

]

# Passive #
def passive
	m=[]

	# X-Powered-By header
	m << { :name=>"X-Powered-By header" } if @headers["x-powered-by"] =~ /^TBDev Yuna Scatari Edition/
	m << { :name=>"X-Powered-By header" } if @headers["x-powered-by"] =~ /^TBDev YSE/

	# X-Chocolate-to header
	m << { :name=>"X-Chocolate-to header" } if @headers["x-chocolate-to"] =~ /^ICQ 7282521$/

	# Return passive matches
	m
end

end

