##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Karrigell" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-05-30
version "0.1"
description "Karrigell is a flexible Python web framework, with a clear and intuitive syntax. It is independent from any database, ORM or templating engine, and lets the programmer choose between a variety of coding styles. - Homepage: http://karrigell.sourceforge.net/en/index.html"

# ShodanHQ results as at 2011-05-30 #
# 69 for Karrigell
#  6 for Karrigell -Python



# Passive #
def passive
	m=[]

	# Version Detection # HTTP Server Header
	m << { :version=>@headers["server"].scan(/^Karrigell\/([^\s]+) /) } if @headers["server"] =~ /^Karrigell\/([^\s]+) /

	# Version Detection # HTTP Server Header
	m << { :version=>@headers["server"].scan(/^Karrigell ([^\s]+)$/) } if @headers["server"] =~ /^Karrigell ([^\s]+)$/

	# Return passive matches
	m
end

end

